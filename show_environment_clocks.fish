function show_environment_clocks --description 'Show the current time of a group of hosts in an Ansible inventory'
  if test (count $argv) -ne 1
      echo "Usage: show_environment_clocks <inventory file name> <inventory group name [all]>"
      return 1
  end
  
  cd $ANSIBLE_PATH
  if test ! -f $argv[1]
      echo "$argv[1] inventory does not exist"
      return 1
  end
  
  if not set -q $argv[2]
    set group all
  else
    set group $argv[2]
  end

  set hosts_count (ansible -i $argv[1] $group --list-hosts | tail -n +2 | wc -l)
  ansible -f $hosts_count -i $argv[1] $group -m raw -a 'date' | grep -v connection | grep -v Warning
  echo "There are $hosts_count hosts in the $group group"
  cd
end

# vim:set ts=2 sw=2 sts=2 et :
