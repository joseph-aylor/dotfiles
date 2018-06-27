dirs = Dir.glob('bundle/*')
dirs -= ['bundle/repos.sh']
repos = []
dirs.each{|x| repos.push(`cd #{x} && git remote -v`) }
repos = repos.map{|x| x.sub(/\n.*(push).*/,'' )}.map{|x| x.sub(/origin\s+/,'')}.map{|x| x.sub(/\s\(fetch.*\n/,'')}
repos.each{|x| puts `cd bundle && git submodule add #{x} && cd ..`}
