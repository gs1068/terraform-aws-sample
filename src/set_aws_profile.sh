set -eu

echo 'デプロイ先：ステージング環境 or 本番環境を入力してください。'
read -p 'ex) stage/prod:' ENV

# ステージング環境 or 本番環境のプロファイルを設定
if [ ${ENV} = 'stage' ]; then
    export PS1="\[\e[1;36m\][terraform-sample]\[\e[0;39m\]${PS1}"
    export AWS_PROFILE=terraform-sample
    aws configure list
    echo 'アカウントをterraform-sample-stageへ切り替えました。'
elif [ ${ENV} = 'prod' ]; then
    export PS1="\[\e[1;31m\][terraform-sample-${ENV}]\[\e[0;39m\]${PS1}"
    export AWS_PROFILE=terraform-sample-${ENV}
    aws configure list
    echo 'アカウントをterraform-sample-prodへ切り替えました。'
else
    echo '[stage] or [prod] のAWSアカウントをPCに登録してますか？'
    read -p 'ex) y/N:' ANSWER
    if [ ${ANSWER} = 'y' -o ${ANSWER} = 'Y' ]; then
        echo '[stage] or [prod] のどちらかを入力してください。'
    elif [ ${ANSWER} = 'N' -o ${ANSWER} = 'n' ]; then
        echo 'アカウントの登録を行ってください。'
    else
        echo '[stage] or [prod] のどちらかを入力してください。'
    fi
fi

set +eu