PROJECT_ROOT=`pwd`
cd modules/client/assets
npm install
npm run deploy
cd $PROJECT_ROOT
mix deps.get
mix phx.server
