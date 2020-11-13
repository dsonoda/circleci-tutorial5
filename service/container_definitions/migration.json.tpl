[
  {
    "name": "sample-webapp",
    "image": "481657431265.dkr.ecr.ap-northeast-1.amazonaws.com/sample-image:latest",
    "cpu": 200,
    "memory": null,
    "memoryReservation": 600,
    "essential": true,
    "command": ["/usr/src/app/migration.sh"],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "sample-service",
        "awslogs-region": "ap-northeast-1",
        "awslogs-stream-prefix": "migration"
      }
    },
    "environment": [],
    "secrets": [
      {
        "name": "DB_ENGINE",
        "valueFrom": "/TUTORIAL/DB_ENGINE"
      },
      {
        "name": "DB_HOST",
        "valueFrom": "/TUTORIAL/DB_HOST"
      },
      {
        "name": "DB_NAME",
        "valueFrom": "/TUTORIAL/DB_NAME"
      },
      {
        "name": "DB_PASSWORD",
        "valueFrom": "/TUTORIAL/DB_PASSWORD"
      },
      {
        "name": "DB_PORT",
        "valueFrom": "/TUTORIAL/DB_PORT"
      },
      {
        "name": "DB_USER",
        "valueFrom": "/TUTORIAL/DB_USER"
      },
      {
        "name": "SECRET_KEY",
        "valueFrom": "/TUTORIAL/SECRET_KEY"
      }
    ]
  }
]