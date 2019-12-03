# Github Action - Generate ECS Task Definition

Generates an ECS task definition from a template file and a JSON list of secrets

## Usage

```
jobs:
  deploy:
    steps:
      - name: Generate task definition
        id: task_def
        uses: utrustdev/action-gen_ecs_task_def
        with:
          template: <task_definition_template_file>
          dictionary: <json_file_with_secrets>
          image: <image_name>
        env:
          AWS_REGION: eu-central-1
          AWS_ACCOUNT_ID: ${{ secrets.AWS_ACCOUNT_ID }}
```
