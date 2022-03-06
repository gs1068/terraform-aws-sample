#!/bin/bash
set -eu
# ビルド作業

# tag付け～pushまで
echo 'デプロイ先：ステージング環境 or 本番環境を入力してください。'
read -p 'ex) stage/prod:' ENV

if [ ${ENV} = 'stage' ]; then

    docker build -t terraform-aws-sample-${ENV} -f Dockerfile .

    export AWS_PROFILE=terraform-sample

    # ecrログイン
    aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 084477982733.dkr.ecr.ap-northeast-1.amazonaws.com

    # tag付け
    docker tag terraform-aws-sample-${ENV}:latest 084477982733.dkr.ecr.ap-northeast-1.amazonaws.com/terraform-aws-sample-${ENV}:latest

    # リポジトリへpush

    docker push 084477982733.dkr.ecr.ap-northeast-1.amazonaws.com/terraform-aws-sample-stage

elif [ ${ENV} = 'prod' ]; then

    docker build -t terraform-aws-sample-${ENV} -f Dockerfile .

    export AWS_PROFILE=terraform-sample

    # ecrログイン
    aws ecr get-login-password --region ap-northeast-1 | docker login --username AWS --password-stdin 084477982733.dkr.ecr.ap-northeast-1.amazonaws.com

    # tag付け
    docker tag terraform-aws-sample-${ENV}:latest 084477982733.dkr.ecr.ap-northeast-1.amazonaws.com/terraform-aws-sample-${ENV}:latest

    # リポジトリへpush

    docker push 084477982733.dkr.ecr.ap-northeast-1.amazonaws.com/terraform-aws-sample-prod

else
    echo '[stage] or [prod] のAWSアカウントをPCに登録してますか？'
    read -p 'ex) y/N:' ANSWER
    if [ ${ANSWER} = 'y' -o ${ANSWER} = 'Y' ]; then
        echo '[stage] or [prod] のどちらかを入力してください。'
    elif [ ${ANSWER} = 'N' -o ${ANSWER} = 'n' ]; then
        echo 'aws-info.txtを確認してアカウントの登録を行ってください。'
    else
        echo '[stage] or [prod] のどちらかを入力してください。'
    fi
fi

set +eu