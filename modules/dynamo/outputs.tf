output "aws_dynamodb_pacientes_table_name" {
  value = aws_dynamodb_table.pacientes_table.name
}

output "aws_dynamodb_agendamento_table_name" {
  value = aws_dynamodb_table.agendamento_table.name
}