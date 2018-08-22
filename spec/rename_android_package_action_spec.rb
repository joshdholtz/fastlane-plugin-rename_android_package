describe Fastlane::Actions::RenameAndroidPackageAction do
  describe '#run' do
    it 'prints a message' do
      expect(Fastlane::UI).to receive(:message).with("The rename_android_package plugin is working!")

      Fastlane::Actions::RenameAndroidPackageAction.run(nil)
    end
  end
end
