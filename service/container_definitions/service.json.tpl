[
  {
    "name": "sample-webapp",
    "image": "481657431265.dkr.ecr.ap-northeast-1.amazonaws.com/sample-image:latest",
    "cpu": 333,
    "memoryReservation": 600,
    "essential": true,
    "portMappings": [
      {
        "hostPort": 0,
        "protocol": "tcp",
        "containerPort": 8000
      }
    ],
    "command": ["/usr/src/app/entrypoint.sh"],
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-group": "sample-service",
        "awslogs-region": "ap-northeast-1",
        "awslogs-stream-prefix": "service"
      }
    }
  }
]