class MySpec < MiniTest::Chef::Spec
  describe 'check master node' do
    it 'script must running' do
      res = assert_sh "python #{node[:disco][:home]}/count_words.py"
    end
  end
end