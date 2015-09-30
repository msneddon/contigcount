script_dir=$(dirname "$(readlink -f "$0")")
export PERL5LIB=$script_dir/../lib:$PERL5LIB
export KB_DEPLOYMENT_CONFIG=$script_dir/../deploy.cfg
WORK_DIR=/kb/module/work
cat $WORK_DIR/token | xargs perl $script_dir/../lib/Bio/KBase/contigcount/Server.pm $WORK_DIR/input.json $WORK_DIR/output.json
