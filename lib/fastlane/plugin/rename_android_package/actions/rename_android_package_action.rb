require 'fastlane/action'
require_relative '../helper/rename_android_package_helper'

module Fastlane
  module Actions
    class RenameAndroidPackageAction < Action
      def self.run(params)
        path = params[:path]
        package_name = params[:package_name]
        new_package_name = params[:new_package_name]

        if package_name != new_package_name
        
          folder = package_name.gsub('.', '/')
          new_folder = new_package_name.gsub('.', '/')
          new_folder_path = "#{path}/app/src/main/java/#{new_folder}"

          FileUtils.mkdir_p(new_folder_path)
          FileUtils.mv Dir.glob("#{path}/app/src/main/java/#{folder}/*"), new_folder_path

          Bundler.with_unbundled_env do
            sh "find #{path}/app/src -name '*.java' -type f -exec sed -i '' 's/#{package_name}/#{new_package_name}/' {} \\;"
            sh "find #{path}/app/src -name 'AndroidManifest.xml' -type f -exec sed -i '' 's/#{package_name}/#{new_package_name}/' {} \\;"
            sh "find #{path}/app -name 'build.gradle' -type f -exec sed -i '' 's/#{package_name}/#{new_package_name}/' {} \\;"
          end
        end
       UI.message "Old and new package names match, nothing to do, exiting"
      end

      def self.description
        "Renames Android package"
      end

      def self.authors
        ["joshdholtz"]
      end

      def self.details
        "Renames Android package"
      end

      def self.available_options
        [
          FastlaneCore::ConfigItem.new(key: :path,
                                       env_name: "FL_RENAME_ANDROID_PACKAGE_PATH",
                                       description: "Path of root Android project folder",
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :package_name,
                                       env_name: "FL_RENAME_ANDROID_PACKAGE_PACKAGE_NAME",
                                       description: "Old package name",
                                       is_string: true),
          FastlaneCore::ConfigItem.new(key: :new_package_name,
                                       env_name: "FL_RENAME_ANDROID_PACKAGE_NEW_PACKAGE_NAME",
                                       description: "New package name",
                                       is_string: true)
        ]
      end

      def self.is_supported?(platform)
        [:android].include?(platform)
      end
    end
  end
end
