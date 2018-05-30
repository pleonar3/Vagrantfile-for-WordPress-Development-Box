# Cross platform VM starter
# This will start the VM whether you're working on WSL or native linux
# WSL requires Virtualbox be installed natively on Windows 10
#   Navigate here for details:
#   https://www.vagrantup.com/docs/other/wsl.html

FILE="./Vagrantfile"
SEARCH_LINE="Vagrant.configure('2') do |config|"
INSERT_LINE="config.vm.provider 'virtualbox' do |vb|; vb.customize [ 'modifyvm', :id, '--uartmode1', 'disconnected']; end"
SED_COMMAND_INSERT="s/${SEARCH_LINE}/${SEARCH_LINE}\n${INSERT_LINE}/"
GREP_SEARCH_LINE="config.vm.provider"
SED_COMMAND_DELETE="/${GREP_SEARCH_LINE}/d"

if grep -q Microsoft /proc/version; then
  if ! grep -qF "${GREP_SEARCH_LINE}" $FILE; then
    sed -i "${SED_COMMAND_INSERT}" $FILE;
  fi
else
  if grep -qF "${GREP_SEARCH_LINE}" $FILE; then
    sed -i "${SED_COMMAND_DELETE}" $FILE;
  fi
fi

vagrant up
