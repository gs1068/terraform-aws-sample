#!/bin/bash
set -eu

terraform_create_workspace () {
    cd ./${DEPLOY}
    terraform init
    terraform workspace new stage
    terraform workspace new prod
    cd ..
}

echo 'AWSリソース構築：step1 or step2 or step3を入力してください。'
read -p 'ex) step1/step2/step3:' DEPLOY

if [ ${DEPLOY} = 'step1' ]; then
    terraform_create_workspace

# step2 をデプロイ
elif [ ${DEPLOY} = 'step2' ]; then
    terraform_create_workspace

# step3 をデプロイ
elif [ ${DEPLOY} = 'step3' ]; then
    terraform_create_workspace

else
    echo '[step1] or [step2] or [step3] のいずれかを入力してください。'
fi