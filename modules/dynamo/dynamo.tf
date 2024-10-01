provider "aws" {
  region = "us-east-1"
}

resource "aws_dynamodb_table" "pacientes_table" {
  name           = "pacientes-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "cpf"  # Chave de partição

  attribute {
    name = "cpf"
    type = "S"
  }

  tags = {
    Name        = "PacientesDynamoDBTable"
    Environment = "dev"
  }
}

resource "aws_dynamodb_table" "agendamento_table" {
  name           = "agendamento-table"
  billing_mode   = "PROVISIONED"
  read_capacity  = 2
  write_capacity = 2
  hash_key       = "protocolo"  # Chave de partição

  attribute {
    name = "protocolo"
    type = "S"  # String
  }

  attribute {
    name = "cpfPaciente"
    type = "S"
  }

  attribute {
    name = "idMedico"
    type = "S"
  }

  attribute {
    name = "horarioAgendamento"
    type = "S"
  }

  attribute {
    name = "status"
    type = "S"
  }

  global_secondary_index {
    name               = "cpfPaciente-index"
    hash_key           = "cpfPaciente"
    projection_type    = "ALL"
    read_capacity      = 2
    write_capacity     = 2
  }

  # Índice para idMedico
  global_secondary_index {
    name               = "idMedico-index"
    hash_key           = "idMedico"
    projection_type    = "ALL"
    read_capacity      = 2
    write_capacity     = 2
  }

  # Índice para horarioAgendamento
  global_secondary_index {
    name               = "horarioAgendamento-index"
    hash_key           = "horarioAgendamento"
    projection_type    = "ALL"
    read_capacity      = 2
    write_capacity     = 2
  }

  # Índice para status
  global_secondary_index {
    name               = "status-index"
    hash_key           = "status"
    projection_type    = "ALL"
    read_capacity      = 2
    write_capacity     = 2
  }

  tags = {
    Name        = "AgendamentoTable"
    Environment = "dev"
  }
}
