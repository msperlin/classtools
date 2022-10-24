l_str <- list()
l_str$subject <- paste0('{class_name}: {exerc_name} disponível no Moodle')

l_str$body <- paste0('Caros alunos,\n\n',
                          'A {exerc_name} [{n_q} questões] já está disponível no Moodle. ',
                          '\nO prazo para entrega é {format(my_deadline, "%d/%m/%Y %H:%M")}',
                          ' ({weekdays(my_deadline)}).\n\n')

l_str$links <- paste0('Caso necessário, os arquivos com dados estão disponíveis em:\n\n{link_github}\n\n',
                           'At,')

readr::write_rds(l_str, 'inst/extdata/other-data/email-str.rds')
