#!/bin/bash
set -eu

# ステージング環境 and 本番環境でTerraform applyコマンドの定義
terraform_apply_stage () {
    cd ./${DEPLOY}
    # terraform fmt
    # terraform init -reconfigure -backend-config=stage.tfbackend
    # terraform apply -var-file=stage.tfvars
    cd ..
}

terraform_apply_prod () {
    cd ./${DEPLOY}
    # terraform fmt
    # terraform init -reconfigure -backend-config=prod.tfbackend
    # terraform apply -var-file=prod.tfvars
    cd ..
}



# [source set_aws_profile.sh] を実行し、デプロイ先を指定しているか確認
if [ ${AWS_PROFILE} = 'terraform-sample' -o ${AWS_PROFILE} = 'terraform-sample-prod' ]; then
    :
else
    echo '[source set_aws_profile.sh] を実行し、デプロイ先を指定して下さい。'
    exit 1
fi



echo 'デプロイ先：ステージング環境 or 本番環境を入力してください。'
read -p 'ex) stage/prod:' ENV

# ステージング環境 or 本番環境でTerraform applyコマンドを切り替える
if [ ${ENV} = 'stage' ]; then
    echo 'AWSリソース構築：step1 or step2 or step3を入力してください。'
    read -p 'ex) step1/step2/step3:' DEPLOY

    # step1 をデプロイ
    if [ ${DEPLOY} = 'step1' ]; then
        terraform_apply_stage

    # step2 をデプロイ
    elif [ ${DEPLOY} = 'step2' ]; then
        terraform_apply_stage

    # step3 をデプロイ
    elif [ ${DEPLOY} = 'step3' ]; then
        terraform_apply_stage

    else
        echo '[step1] or [step2] or [step3] のいずれかを入力してください。'
    fi


elif [ ${ENV} = 'prod' ]; then
    # git checkout v1.0.0/${ENV}
    echo 'AWSリソース構築：step1 or step2 or step3を入力してください。'
    read -p 'ex) step1/step2/step3:' DEPLOY

    # step1 をデプロイ
    if [ ${DEPLOY} = 'step1' ]; then
        terraform_apply_prod

    # step2 をデプロイ
    elif [ ${DEPLOY} = 'step2' ]; then
        terraform_apply_prod

    # step3 をデプロイ
    elif [ ${DEPLOY} = 'step3' ]; then
        terraform_apply_prod

    else
        echo '[step1] or [step2] or [step3] のいずれかを入力してください。'
    fi
    
else
    echo '[stage] or [prod] のどちらかを入力してください。'
fi