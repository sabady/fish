function get_resources_list --description 'Extract the target resources for terrafom plan' --argument filename
 grep resource $filename | grep -v '^.*#' | awk '{print $2 $3}' | sed 's/""/./g' | tr -d '"' | xargs -I % sh -c 'echo -target %' | xargs; 
end
