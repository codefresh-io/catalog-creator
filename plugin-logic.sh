       #1 repo name 
       set -e

       repo=$1 
       indexPath=$2 
       masterBranch=$3
       CF_BRANCH= $4
       #clean=true
         
       : ${repo:="https://github.com/codefresh-io/plugins.git"}
       : ${masterBranch:="master"}
       : ${CF_BRANCH:=$(git branch -v | awk 'NR==1 { print $2}')}
       echo $CF_BRANCH vs $masterBranch
       if [ $CF_BRANCH == $masterBranch ]; then
          exit 1
       fi
      
       #export CF_SHORT_REVISION= CF_SHORT_REVISION || 1234
       echo git clone  of $repo
       if [ -d $PWD/pluginsFolder ]; then
            echo "plugin folder already exists."
            cd ./pluginsFolder
            git pull origin $CF_BRANCH
            cd ..
        else
          echo 'clonning ..'
          git clone  $repo pluginsFolder #&1>/dev/null
          echo 'after clone'
       fi
       
       cd ./pluginsFolder  
       git checkout $CF_BRANCH
        
       echo running catalog builder 
       node ../src/index
       echo $PWD
     
       git commit -am "plugins"_$(date +'%Y-%m-%d-%H-%M-%S')
       
       ls && git status
       git push origin $CF_BRANCH || true
       if [ $clean ] ; then
          echo 'removing folder'
          cd .. && rm -rf ./pluginsFolder
        
       fi