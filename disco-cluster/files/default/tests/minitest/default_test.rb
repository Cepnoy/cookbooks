class MySpec < MiniTest::Chef::Spec
  describe 'install disco slave' do
    it 'master host should be connected by ssh' do
      res = assert_sh "sudo -u #{node[:disco][:user]} bash -c 'ssh #{node[:disco][:master][:host]} -o ConnectTimeout=3 ls' "
    end
  end
end
