provider "docker" { 
    registry_auth { 
        address = data.aws_ecr_authorization_token.ecr_token.proxy_endpoint 
        username = data.aws_ecr_authorization_token.ecr_token.user_name 
        password = data.aws_ecr_authorization_token.ecr_token.password 
    } 
}

resource "aws_ecr_repository" "taskoverflow" { 
    name = "taskoverflow"
}

resource "docker_image" "taskoverflow" { 
    name = "${aws_ecr_repository.taskoverflow.repository_url}:latest" 
    build { 
        context = "." 
    } 
}

resource "docker_registry_image" "taskoverflow" { 
    name = docker_image.taskoverflow.name
}
