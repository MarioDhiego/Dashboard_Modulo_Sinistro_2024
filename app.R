#===============================================================================#
# 1.0 INTERFACE GERAL ----------------------------------------------------------
#===============================================================================#

#              DETRAN-PA - Departamento de Trânsito do Estado do Pará
#===============================================================================#
#==== DESCRIÇÃO:    Dashboard de Sinistros de Trânsito - Pará
#==== ESCRITO POR:  Mário Diego Valente
#====               Tito Félix de Oliveira
#====               Kleber Bezerra Salim
#==== SITE:         https://www.detran.pa.gov.br/
#==== LICENÇA:      MIT
#==== PROJETO:      https://github.com/MarioDhiego/DashBoard_Detran_2023
#===============================================================================#

#===============================================================================#
# 1.1 CARREGAR ARQUIVO GERAL ---------------------------------------------------
source("global.R")
#===============================================================================#

#===============================================================================#
# 2.0 ETAPAS DO DASHBOARD ------------------------------------------------------
# 2.1 DashboardPage ------------------------------------------------------------

shinyApp(
  ui = dashboardPage(#title = "Dash Detran-PA",
    #skin = "blue", 
    #freshTheme = NULL,
    #preloader = NULL,
    #options = list(sidebarExpandOnHover = TRUE),
    #scrollToTop = TRUE,
    #footer = dashboardFooter(left="Copyright © DETRAN-PA - Todos os Direitos Reservados",
    #                      right="Belém-PA, 2023 V.1"),
    #===============================================================================#
    # 2.2 DashboardHeader ----------------------------------------------------------
    header = dashboardHeader(title= span(tags$b("Sinistros de Trânsito")),
                             #titleWidth = 280,
                             #disable = FALSE,
                             #fixed = FALSE,
                             #===============================================================================#
                             # 2.2.1 Redes Sociais ----------------------------------------------------------
                             tags$li(class = "dropdown",
                                     a(href = "https://www.facebook.com/detranPARA",
                                       class = "fa fa-facebook",
                                       target = "_blank"
                                     )),
                             tags$li(class = "dropdown",
                                     a(href = "https://www.instagram.com/detranpa_",
                                       class = "fa fa-instagram",
                                       target = "_blank"
                                     )
                             ),
                             tags$li(class = "dropdown",
                                     a(href = "https://twitter.com/DETRAN_PA",
                                       class = "fa fa-twitter",
                                       target = "_blank"
                                     )),
                             tags$li(
                               class="dropdown",
                               tags$a(href="https://github.com/MarioDhiego",
                                      icon("github"), "Suporte", target = "_blank"))
    ),
    #===============================================================================#
    # dbHeader,
    skin = "blue",
    scrollToTop = TRUE,
    options = list(sidebarExpandOnHover = TRUE),
    #tags$li(
    # class="dropdown",
    # tags$a(href="",
    #       icon("question"), "AJUDA", target = "_blank"))
    
    #===============================================================================#
    # 2.3 DashboardSidebar ---------------------------------------------------------
    sidebar = dashboardSidebar(minified = FALSE,
                               collapsed = FALSE,
                               #sidebarSearchForm(textId="SearchText",
                               #                  buttonId="buttonSearch",
                               #                  label="Busca",
                               #                  icon=icon("folder-open")),
                               #div(id = "sidebar_button",
                               #    bsButton(inputId = "confirm", 
                               #             label = "START", 
                               #             icon = icon("play-circle"), 
                               #             style = "danger")
                               #),
                               #===============================================================================#
                               # 2.3.1 Imagem -----------------------------------------------------------------
                               tags$img(src = "detran1.jpeg", 
                                        #src = "Governo_Para.png",
                                        width = 230, 
                                        heigth = 100),
                               #===============================================================================#
                               # 2.3.2 Sidebar Menu -----------------------------------------------------------
                               sidebarMenu(
                                 id = "tabs",
                                 menuItem("ANUÁRIO", tabName="anuario", icon=icon("address-card"),
                                          menuSubItem("Sobre Anuário", tabName="sobre1", icon=icon("book")),
                                          menuSubItem("Vídeo Institucional", tabName="video1", icon=icon("video"))),
                                 menuItem("MICRODADOS", tabName="microdados", icon=icon("database")),
                                 menuItem("GLOSSÁRIO", tabName="conceitos", icon=icon("book")),
                                 menuItem("SÓCIOECONÔMICO", tabName="socioeconomico", icon=icon("male")),
                                 menuItem("CONDIÇÃO DA VÍTIMA", tabName="condicao_da_vitima",icon=icon("wheelchair")),
                                 menuItem("OCORRÊNCIAS", tabName="ocorrencias", icon=icon("calendar")),
                                 menuItem("PICTOGRAMAS", tabName="pictogramas", icon=icon("road-bridge")),
                                 menuItem("RODOVIA ESTADUAL", tabName="custo_hospitalar", icon=icon("road-bridge")),
                                 menuItem("MAPAS", tabName="localizacao", icon=icon("globe")),
                                 menuItem("INDICADORES", tabName="taxas", icon=icon("dashboard"),
                                          menuSubItem("Taxa de Mortalidade", tabName="taxas1"),
                                          menuSubItem("Taxa de Internação", tabName="taxas4"),
                                          menuSubItem("Taxa de Motorização", tabName="taxas2"),
                                          menuSubItem("Taxa de Crescimento", tabName="taxas3")
                                 )
                               )
    ),
    #===============================================================================#
    # 2.4 DashboardBody ------------------------------------------------------------
    body = dashboardBody(
      
      #valueBoxOutput("contador_acessos"),
      
      fluidPage(
        tags$head(
          tags$link(rel = "shortcut icon", href = "icons8-favicon-94.png", type = "image/x-icon"),
          tags$link(
            rel = "stylesheet",
            href = "https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          )
        )
      ),
      #===============================================================================#
      tabItems(
        tabItem(tabName="sobre1",
                tabBox(id="t1", width=12,
                       tabPanel("ANUÁRIO WEB",icon=icon("address-card"),
                                fluidRow(column(width=8,
                                                position="left",solidHeader = TRUE,
                                                tags$img(
                                                  id="foto1",
                                                  src="detran_stm.jpeg",
                                                  controls="controls",
                                                  width=700,height=450),
                                                tags$br(), 
                                                tags$a("Photo by Asdecom"),align="left"),
                                         column(width=4,
                                                tags$br(),
                                                tags$p(style="text-align:justify;font-si20pt",
                                                       strong("A Assembléia Geral da Organização das Nações Unidas(ONU), por meio da Resolução A/RES/74/299, de 31 de agosto de 2020, lançou a Década de Ação pela Segurança Viária 2021/2030, com objetivo de reduzir em pelo menos 50/% de vítimas fatais e feridos graves no trânsito, bem como solicita aos Estados-Membros que continuem adotando medidas até 2030 para alcançar as metas dos Objetivos de Desenvolvimento Sustentável relacionados a Segurança Viária, em especial a meta 3.6.")),
                                                tags$br(),
                                                tags$p(style="text-align: justify;font-si20pt",
                                                       strong("O DETRAN-PA, com sua missão fundamentada nos princípios da Política Nacional de Trânsito(Resolução do CONTRAN Nº514, de 18 de dezembro de 2014), apresenta, neste Painél, o Processo de Integração de Múltiplas Bases de Dados (Pareamento) sobre vítimas fatais por acidentes de trânsito.")),
                                                tags$br(),
                                                tags$p(style="text-align: justify;font-si20pt",
                                                       strong("O Processo de Integração de Dados foi Realizado junto aos 144 municípios que compõem o Estado do Pará. Como Resultados foi criado uma Lista Ùnica de Vítimas Fatais(LUVF). Houve um incremento médio de 35/% em relação total de vítimas contabilizadas antes da utilização do processo de pareamento."))
                                         )
                                )
                       ),
                       #===============================================================================#
                       tabPanel("LINHA DE BASE", icon=icon("hospital"),
                                fluidRow(
                                  column(
                                    width=4,position="center",solidHeader = TRUE,
                                    tags$br(), 
                                    tags$p(style="text-align:justify;font-si20pt",
                                           strong("A Definição de Mortes e VÍtimas Graves foi Estabelecida com Base no Padrão da Organização Mundial de São de (WHO, 2022).")),
                                    tags$br(),
                                    tags$p(style="text-align:justify;font-si20pt",
                                           strong("1) VÍtima Fatal: uma pessoa morta imediatamente ou até 30 dias, como resultado do acidente de trânsito.")),
                                    tags$br(),
                                    tags$p(style="text-align:justify;font-si20pt",
                                           strong("2) VÍtima Grave: a pessoa hospitalizada por pelo menos 24 horas devido a ferimentos sofridos em acidentes de trânsito."))
                                  )
                                ) 
                       ),
                       #===============================================================================#
                       tabPanel("ALINHAMENTO TÉCNICO", icon = icon("layer-group"),
                                fluidRow(
                                  column(
                                    width=4, position="center",solidHeader = TRUE,
                                    tags$br(),
                                    tags$p(style="text-align: justify;font-si20pt",
                                           strong("A Lei nº 13.614/2018 criou Plano Nacional de Redução de Mortes e Lesões no Trânsito(PNATRANS), acrescentando o artigo 326-A ao Código de Trânsito Brasileiro (CTB), e propôs um novo desafio para a gestão de trânsito no Brasil e para os orgãos integrados do Sistema Nacional de Trânsito(SNT).")),
                                    tags$br(),
                                    tags$a("Pnatrans",
                                           href = "https://www.gov.br/transportes/pt-br/assuntos/transito/arquivos-senatran/anexo_i_pnatrans_2.pdf"),
                                    tags$br(),
                                    tags$p(style="text-align: justify;font-si20pt",
                                           strong("Em 2020, foi realizado um diagnóstico, envolvendo todas as Unidades Federativas com o objetivo de estabelecer uma metodologia padronizada de coleta e tratamento dos dados sobre acidentes de trânsito e uma gestão baseada em análises e melhoria do sistema de segurança viária para todo Brasil. A fim de definir dados mínimos sobre acidentes de forma padronizada, alinhar as Unidades Federativas sobre o processo e sobre a implantação do modelo e, por fim, garantir análises e atuação sobre as causas críticas com intuito de minimizar os acidentes de trânsito no país.")),
                                    tags$br(),
                                    tags$p(style="text-align: justify;font-si20pt",
                                           strong("Nesse Contexto, o Anuário Estatístico de Acidentes de Trânsito, será construído em Alinhamento ao Manual de Gestão do RENAEST (Resolução do CONTRAN Nº808/2020), utilizando metodologias factíveis com estatísticas de trânsito padronizada para todo o Território Nacional, e aos Objetivos de Desenvolvimento Sustentáveis (Resolução da ONU Nº70/2015)."))
                                  )  
                                )
                       ),
                       #===============================================================================#
                       tabPanel("SOFTWARE'S", icon=icon("computer"),
                                fluidRow(
                                  column(width=4,
                                         position="center",solidHeader = TRUE,
                                         tags$br(),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("Para Criação do Anuário em Formato Web com Dasboard Interativos, foi Desenvolvido um script em Linguagem de Programação R-PROJECT Versão 4.2.2, no formato de Projeto de Software Livre de Código Aberto (open source), ou seja, pode ser utilizado sem custos de licença (R DEVELOPMENT CORE TEAM, 2022)")),
                                         tags$br(),
                                         tags$img(
                                           id="foto2",
                                           src="R.jpg",
                                           controls="controls",
                                           width=100,height=100),
                                         tags$br(),
                                         tags$a("Software R",
                                                href = "https://cran.r-project.org/bin/windows/base/R-4.3.2-win.exe"),
                                         tags$br(),
                                  ),
                                  column(width=4,
                                         position="center",solidHeader = TRUE,
                                         tags$br(),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("Foi utilizado um Ambiente de Desenvolvmento Integrado (IDE) Chamado Rstudio Versão 1.4.1.7, utilizando um Processo de Extração-Transformação-Carga(ETL) com uso de Várias bibliotecas (library), para o Ambiente Windows")),
                                         tags$br(),
                                         tags$img(
                                           id="foto3",
                                           src="RStudio.png",
                                           controls="controls",
                                           width=150,height=150),
                                         tags$br(),
                                         tags$a("RStudio",
                                                href = "https://download1.rstudio.org/electron/windows/RStudio-2023.09.1-494.exe"),
                                         tags$br(),
                                  )
                                )
                       ),
                       #===============================================================================#
                       tabPanel("MATERIAL E MÉTODOS", icon=icon("book"),
                                fluidRow(
                                  column(width=4,
                                         position="center",solidHeader = TRUE,
                                         tags$br(), 
                                         tags$br("Metodologia"), 
                                         tags$br(),
                                         tags$p(style="text-align:justify;font-si20pt",
                                                strong("A Metodologia Adotada para o Planejamento e execução do Projeto foi apoiada na Estratégia de Proatividade e Parceria Desenvolvida pela GRSP (CARDITA e DI PIETRO, 2010).")),
                                         tags$br(),
                                         tags$p(style="text-align:justify;font-si20pt",
                                                strong("A Estratégia de Proatividade e Parceria (EPP) consiste em um Modelo Desenvolvido para Tratar das questões de Segurança no Trânsito.")),
                                         tags$br(),
                                         tags$p(style="text-align:justify;font-si20pt",
                                                strong(" As Etapas a Serem Desenvolvidas Durante Aplicação do Projeto são:")),
                                         tags$br(),
                                         tags$p(style="text-align:justify;font-si20pt",
                                                strong("1) Articulação Intersetorial e Formação")),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("2) Qualificação, Integração e Análise de Dados")),
                                         tags$p(style="text-align: justify;font-si20pt",
                                             
                                                   strong("3) Ações Integradas de Segurança no Trânsito")),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("4) Monitoramento, Avaliação de Desenpenhp e Reconhecimento")),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("5) Revisão Geral Anual")),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("6) Renovação e Expansão"))
                                  ),
                                  tags$br(),
                                  column(width=4,position="center",solidHeader = TRUE,
                                         tags$br("Pareamento"),
                                         tags$br(),
                                         tags$p(style="text-align:justify;font-si20pt",
                                                strong("Para o Relacionamento das Múltiplas Bases de Dados(pareamento), utilizou-se o Método Probabilístico de Relacionamento de Registro desenvolvido por Fellegi e Sunter (1969).")),
                                         tags$br(),
                                         tags$p(style="text-align:justify;font-si20pt",
                                                strong("A principal dificuldade do pareamento é a não existência de um identificador único que permita vincular um Boletim de Ocorrência à uma Autorização de Internação Hospitalar ou Declaração de Òbito.")),
                                         tags$br(),
                                         tags$p(style="text-align:justify;font-si20pt",
                                                strong("O Processo de Padronização de Variáveis, utilizando o Método Probabilístico, foi realizado para homogeneizar as variáveis das diferentes bases de dados, visando minimizar erros no processo de pareamento, com a alocação de registros da mesma vítima num bloco lógico para evitar: erros fonéticos, perda de informação, etc."))
                                  )
                                )
                       ),
                       #===============================================================================#
                       tabPanel("CRÉDITOS", icon=icon("phone"),
                                fluidRow(
                                  column(width=4,position="center",solidHeader = TRUE,
                                         tags$br(),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("DEPARTAMENTO DE TRÂNSITO DO ESTADO DO PARÁ - DETRAN/PA")),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("RENATA MIRELA COELHO")),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("AVENIDA: AUGUSTO MONTENEGRO KM 03 S/N")),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("CEP: 66635-918 - PARQUE VERDE - BELÉM - PARÁ")),
                                         tags$a("https://www.detran.pa.gov.br", 
                                                href = "https://www.detran.pa.gov.br"),
                                         tags$br(),
                                         tags$br(),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("Esta publicação deve ser citada como: Departamento de Trânsito do Estado do Pará (DETRAN-PA), Anuário Estatístico de Acidentes de Trânsito, 2023 (LC/PUB.2023/1-P), Belém, 2023.")),
                                         tags$br(),
                                         tags$p(style="text-align: justify;font-si20pt",
                                                strong("A autorização para a reprodução total ou parcial deste trabalho deve ser solicitada ao Departamento de Trânsito do Estado do Pará, Gerência de Análise e Estatística de Trânsito, gerest@detran.pa.gov.br. Os Estados membros das Nações Unidas e suas instituições governamentais podem reproduzir este trabalho sem autorização prévia. Solicita-se apenas que mencionem a fonte e informem ao DETRAN-PA de tal reprodução.")
                                         ),
                                         tags$br(),
                                         
                                  ),
                                  column(
                                    width=4,
                                    position="center",
                                    solidHeader = TRUE,
                                    tags$br(),
                                    leafletOutput("mapa"),
                                  )
                                  
                                )        
                       ),
                       #===============================================================================#
                       tabPanel("SUGESTÕES",
                                fluidRow(
                                  column(
                                    width=4,
                                    position="center",
                                    tags$br(),
                                    tags$p(style="text-align: justify;font-si20pt",
                                           strong("Reclamações, sugestões, críticas e elogios relacionados ao Anuário
Estatístico de Acidentes de Trânsito do DETRAN-PA podem ser registrados na Gerência de Análise Estatística de Trânsito, por intermédio do ")),
tags$a("estatisticadetransito@detran.pa.gov.br", 
       href = "gerest@detran.pa.gov.br"),
                                  )
                                )
                       )
                )
        ),
#===============================================================================#
tabItem(tabName="video1",
        tabBox(id="t2", width=12,
               tabPanel("Video Institucional",icon=icon("video"),
                        fluidRow(
                          column(width=8, position="center",solidHeader = TRUE,
                                 tags$br("Projeto Strengthening Road Traffic Enforcement in Brazil"),
                                 tags$video(
                                   id = "videoID",
                                   type="video/mp4",
                                   src="video_detran.mp4",
                                   width= 700, height=450,
                                   controls="controls"
                                 ),
                                 tags$br() , 
                                 tags$a("Video: by Asdecom"),align="left"),
                          column(width=4,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("O Departamento de Trânsito do Estado do Pará obteve o Projeto “Strengthening Road Traffic Enforcement
in Brazil” aprovado e financiado pela (United Road Safety Fund), com duração de 12 meses, se constituindo
o único selecionado do Brasil, que somado as propostas de alguns outros países, formam o conjunto de projetos
nacionais administrados pelo Fundo, coordenado e supervisionados por diversas Agências e Comissões
Regionais das Nações Unidas.")
                                 ),
tags$br(),
tags$p(style="text-align: justify;font-si20pt",
       strong("Concomitantemente, o Projeto Brasileiro é supervisionado pela Comissão Econômica das Nações
Unidas para América Latina e Caribe (CEPAL), coordenado e implementado pelo DETRAN-PA
em parceria com Conselho Estadual de Trânsito do Estado do Pará (CETRAN-PA), e tem como objetivo
contribuir para a redução de mortes e lesões no Trânsito através das atividades de Educação, Engenharia e
Fiscalização em nível Estadual."))))))),
#===============================================================================#
tabItem(tabName = "conceitos",
        tabBox(id="t3", width = 12,
               tabPanel("TURNOS", icon = icon("calendar"),
                        fluidRow(
                          column(width=4,solidHeader = TRUE,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("O Horário dos Sinistros é Classificados em quatro Turnos a saber:")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("1) MADRUGADA: compreende todos os acidentes ocorridos a partir da hora (00:00 minutos até às 05:59min)")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("2) MANHÃ: compreende todos os acidentes ocorridos a partir da hora (06:00 minutos até às 11:59min);")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("3) TARDE: compreende todos os acidentes ocorridos a partir da hora (12:00 minutos até às 17:59min); ")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("4) NOITE: compreende todos os acidentes ocorridos a partir da hora (18:00 minutos até às 23:59min); "))
                          )
                        )
               ),
               #===============================================================================#
               tabPanel("VÍTIMAS", icon = icon("skull-crossbones"),
                        fluidRow(
                          column(width=4,solidHeader = TRUE,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("1) ILESO: Pessoa que não apresenta nenhum sinal aparente de lesões provenientes da dinâmica do acidente e esteja orientada e consciente.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("2) FERIDO LEVE: Toda pessoa que, em consequência do sinistro, tenha sofrido lesões superficiais sem a necessidade de hospitalização, e que apresente, por consequência da dinâmica do sinistro, ao menos um sinal aparente da lista a seguir:")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("a) Pequenos cortes, contusões e escoriações (inclusive as provocadas por cinto de segurança);")),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("b) Queimaduras de 1º grau (até 10% da superfície corporal);")),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("c) Pequenas hemorragias externas;")),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("d) Luxações e/ou fraturas fechadas e/ou abertas dos dedos."))
                          ),
                          column(
                            width=4,
                            tags$br(),      
                            tags$p(style="text-align:justify;font-si20pt",
                                   strong("3) FERIDO GRAVE: Vítimas de acidente cujos danos corporais (lesões) obriguem a um período de hospitalização superior a 24 horas.")),
                            tags$br(), 
                            tags$p(style="text-align:justify;font-si20pt",
                                   strong("4) FATAL: É qualquer acidente de trânsito em que ocorra a Morte de, pelo menos uma pessoa, até 30 dias após a data do acidente.")),
                            tags$br(), 
                            tags$p(style="text-align:justify;font-si20pt",
                                   strong("5) NÃO FATAL: É qualquer acidente de trânsito em que uma ou mais pessoas sofrem lesões, não ocasionando a morte de nenhuma delas até 30 dias após o acidente."))
                          )
                        )
               ),
               #===============================================================================#
               tabPanel("VIA", icon = icon("road"),
                        fluidRow(
                          column(width=4,solidHeader = TRUE,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("1) VIA: Superfície onde transitam veículos, pessoas e animais, compreendendo a pista, a calçada, o acostamento, ilha, e canteiro central, dividindo-se em competências: municipal, estadual e federal;")),
                                 tags$br(), 
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("2) RODOVIA: inclui todas as rodovias federais (BR), as rodovias do Pará (PA’s) e Estradas Vicinais (VC).")),
                                 tags$br(), 
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("3) URBANA: Todas as vias do Pará, excluindo as Rodovias;")),
                                 tags$br(), 
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("4) RURAL: Trecho de rodovia comprendido em área não edificada;"))
                          )
                        )
               ),
               tabPanel("PISTA", icon = icon("road"),
                        fluidRow(
                          column(width=4,solidHeader = TRUE,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("1) PISTA DUPLA: via em que exista um canteiro central separando dois leitos carroçáveis, independentemente dos sentidos estabelecidos para o trânsito. Pistas separadas por rios e por canteiros centrais extremamente largos, os quais impossibilitam a transposição de um leito carroçável para o outro, são consideradas como pistas simple;")),
                                 tags$br(), 
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("2) PISTA MÚLTIPLA: via em que exista mais de um canteiro central, caracterizando a presença de três ou mais leitos carroçáveis.")),
                                 tags$br(), 
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("3) PISTA SIMPLES: via em que não existe divisão física entre as faixas de trânsito, seja em sendo único ou duplos."))
                          )
                        )
               ),
               #===============================================================================#
               tabPanel("RODOVIAS FEDERAIS", icon = icon("road"),
                        fluidRow(
                          column(width=4,solidHeader = TRUE,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("A Nomenclatura das Rodovias no Brasil, são definidos pelo Plano Nacional de Viação (DNIT, 2023).")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("1) Rodovias Radiais: São as rodovias que partem da Capital Federal em direção aos extremos do país. O sentido de quilometragem vai do Anel Rodoviário de Brasília em direção aos extremos do país, e tendo o quilometro zero de cada estado no ponto da rodovia mais próximo à capital federal.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Nomenclatura: BR-0XX")),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Radiais no Pará: BR-010")),
                                 tags$br(), 
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("2) Rodovias Longitudinal: São as rodovias que cortam o país na direção Norte-Sul. O sentido de quilometragem vai do norte para o sul. As únicas exceções deste caso são as BR-163 e BR-174 , que tem o sentido de quilometragem do sul para o norte.")),
                                 tags$br(), 
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Nomenclatura: BR-1XX")),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Longitudinal no Pará: BR-153, BR-155, BR-158 e BR-163 ")),
                                 tags$br(), 
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("3) Rodovias Transversais: São as rodovias que cortam o país na direção Leste-Oeste. O sentido de quilometragem vai do leste para o oeste.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Nomenclatura: BR-2XX")),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Transversais no Pará: BR-210, BR-222, BR-230 e BR-235"))
                          ), 
                          column(width=4,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("4) Rodovias Diagonais: Estas rodovias podem apresentar dois modos de orientação: Noroeste-Sudeste ou Nordeste-Sudoeste. A quilometragem se inicia no ponto mais ao norte da rodovia indo em direção ao ponto mais ao sul. Como exceções podemos citar as BR-307, BR-364 e BR-392.")),
                                 tags$br(), 
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Nomenclatura: BR-3XX")),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Diagonais no Pará: BR-308 e BR-316")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("5) Rodovias de Ligação: Estas rodovias apresentam-se em qualquer direção, geralmente ligando rodovias federais, ou pelo menos uma rodovia federal a cidades ou pontos importantes ou ainda a nossas fronteiras internacionais. Geralmente a contagem da quilometragem segue do ponto mais ao norte da rodovia para o ponto mais ao sul. No caso de ligação entre duas rodovias federais , a quilometragem começa na rodovia de maior importância.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Nomenclatura: BR-4XX")),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Ligação no Pará: BR-417 e BR-422"))
                          )
                        )
               ),
               #===============================================================================#
               tabPanel("SINISTROS", icon = icon("person-falling-burst"),
                        fluidRow(
                          column(width=4,solidHeader = TRUE,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Todo evento não premeditado de que resulte dano em Veículo ou na sua Carga e/ou lesões em Pessoas e/ou Animais, em que pelo menos uma das partes está em movimento nas vias terrestres ou áreas abertas ao público. Pode originar-se, terminar ou envolver veículo parcialmente na via pública.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("1) ATROPELAMENTO: Acidente em que o(s) pedestre(s) ou animal(is) sofre(m) o impacto de um veículo, estando pelo menos uma das partes em movimento.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("2) ABALROAMENTO: Acidente em que um veículo é colhido lateralmente por outro veículo, também em movimento")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("3) CAPOTAMENTO: Acidente em que o veículo gira sobre si mesmo, em qualquer sentido, chegando a ficar com as rodas para cima, imobilizando-se em qualquer posição.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("4) CHOQUE COM OBJETO FIXO: Acidente em que há impacto de um veículo contra qualquer objeto fixo ou móvel, mas sem movimento.")),
                          ),
                          column(width=4,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("5) COLISÃO ENTRE VEÍCULOS: Acidente em que um veículo em movimento sofre o impacto de outro veículo, também em movimento.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("6) QUEDA DE ÔNIBUS: Acidente em que há impacto em razão de queda livre dentro do ônibus, ou queda de pessoas ou cargas por ela transportadas.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("7) QUEDA DE MOTOCICLETA: Acidente em que há impacto em razão de queda livre da motocicleta, ou queda de pessoas..")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("8) TOMBAMENTO: Acidente em que o veículo sai de sua posição normal, imobilizando-se sobre uma de suas laterais, sua frente ou sua traseira..")) 
                          )
                        )   
               ),
               #===============================================================================#
               tabPanel("CONDUTOR", icon = icon("person"),
                        fluidRow(
                          column(width=4,solidHeader = TRUE,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("Toda pessoa que conduza um veículo automotor, ou de outro tipo, incluindo os ciclos, ou que guie por uma via, cabeças de gado isoladas, rebanho, bando ou manadas, ou animais de tiro, carga ou sela. Sendo habilitados nas seguintes categorias;")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("1) CATEGORIA A: Todos os veículos automotores e elétricos, de duas ou três rodas, com ou sem carro lateral.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("2) CATEGORIA B: Veículos automotores e elétricos, de quatro rodas cujo peso bruto total não exceda a três mil e quinhentos quilogramas e cuja lotação não exceda a 08 (oito) lugares, excluído o do motorista, contemplando a combinação de unidade acoplada, reboque, semi-reboque ou articulada, desde que atenda a lotação e capacidade de peso para a categoria.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("3) CATEGORIA C: Veículos automotores e elétricos, de quatro rodas cujo peso bruto total não exceda a três mil e quinhentos quilogramas e cuja lotação não exceda a 08 (oito) lugares, excluído o do motorista, contemplando a combinação de unidade acoplada, reboque, semi-reboque ou articulada, desde que atenda a lotação e capacidade de peso para a categoria."))),
                          column(width=4,
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("4) CATEGORIA D: Veículos automotores e elétricos utilizados no transporte de passageiros, cuja lotação exceda a 08 (oito) lugares e, todos os veículos abrangidos nas categorias “B” e “C”.")),
                                 tags$br(),
                                 tags$p(style="text-align:justify;font-si20pt",
                                        strong("5) Categoria E: Combinação de veículos em que a unidade tratora se enquadre nas categorias B, C ou D e cuja unidade acoplada, reboque, semirreboque, trailer ou articulada tenha 6.000 kg (seis mil quilogramas) ou mais de peso bruto total, ou cuja lotação exceda a 8 (oito) lugares e, todos os veículos abrangidos pelas categorias “B”, “C” e “D”."))
                          )
                        )
               ),
               #===============================================================================#
               tabPanel("VEÍCULOS", 
                        icon = icon("car"),
                        fluidRow(
                          column(width = 4,solidHeader = TRUE,
                                 tags$br(),
                                 tags$p(style = "text-align:justify;font-si20pt",
                                        strong("Este item relaciona os tipos de veículos definidos no Anexo I, do Regulamento do Código de Trânsito Brasileiro e
Convenção de Trânsito Viário de Viena, bem como da Organização Mundial de Saúde.")),
tags$br(),
tags$p(style = "text-align:justify;font-si20pt",
       strong("1) AUTOMÓVEL: Veículo destinado ao transporte de passageiros, com capacidade para até oito pessoas, mais o condutor;")),
tags$br(),
tags$p(style = "text-align:justify;font-si20pt",
       strong("2) BICICLETA: veículo de propulsão humana, dotado de duas rodas, cujo condutor dirige em posição montada, não sendo similar à motocicleta, motoneta e ciclomotor;")),
tags$br(),
tags$p(style = "text-align:justify;font-si20pt",
       strong("3) CAMINHÃO: Veículo automotor destinado ao transporte de carga com peso bruto total ou superior a 3.500kg, podendo transitar ou arrastar outro veículo, respeitad a capacidade máxima de tração;")),
tags$br(),
tags$p(style = "text-align:justify;font-si20pt",
       strong("4) CAMINHONETE: Veículo destinado ao transporte de carga com peso bruto total de até três mil e quinhentos quilogramas;")),
tags$br(),
tags$p(style = "text-align:justify;font-si20pt",
       strong("5) CAMIONETA: Veículo misto destinado ao transporte de passageiros e carga no mesmo compartimento;")),
tags$br(),
tags$p(style = "text-align:justify;font-si20pt",
       strong("6) CICLOMOTOR: Veículo de duas ou três rodas, provido de um motor de combustão interna, cuja cilindrada não exceda a cinquenta centímetros cúbicos (3,05 polegadas cúbicas) e cuja velocidade máxima de fabricação não exceda a cinquenta quilômetros por hora;")),
                          ),
column(width = 4,
       tags$br(),
       tags$p(style = "text-align:justify;font-si20pt",
              strong("7) MICRO-ÔNIBUS: veículo automotor de transporte coletivo com capacidade oara até 20 passageiros. As vans se enquadram nessa categoria de veículos;")),
       tags$br(),
       tags$p(style = "text-align:justify;font-si20pt",
              strong("8) MOTOCICLETA: veículo automotor de duas rodas, dirigido por condutor em posição montada;")),
       tags$br(),
       tags$p(style = "text-align:justify;font-si20pt",
              strong("9) MOTONETA: veículo automotor de duas rodas, dirigido por condutor em posição sentada;")),
       tags$br(),
       tags$p(style = "text-align:justify;font-si20pt",
              strong("10) TRICICLO: veículo automotor de três rodas com ou sem cabine, dirigido por condutor em posição sentada ou montada, que não possui as casracterísticas de ciclomotor;")),
       tags$br(),
       tags$p(style = "text-align:justify;font-si20pt",
              strong("11) QUADRICICLO: veículo automotor de 4 rodas, com ou sem cabine, com massa de ordem de marcha superior a 450kg, para o transporte de passageiros, ou não superior a 600kg para o transporte de cargas;")),
       tags$br(),
       tags$p(style = "text-align:justify;font-si20pt",
              strong("12) ÔNIBUS: veículo automotor de transporte coletivo com capacidade para mais de 20 passageiros, ainda que, em virtude de adaptações com vista à maior comodidade destes, transporte número menor;")),
       tags$br(),
       tags$p(style = "text-align:justify;font-si20pt",
              strong("13) VEÍCULO ESPECIAL: veículo de passageiro, de carga, de tração, de coleção ou misto que possui características diferenciadas para realização de função especial para a qual são necessários arranjos específicos de carroceria e/ou equipamento;"))
)
                        )
               ),
#===============================================================================#
tabPanel("INDICADORES",
         fluidRow(
           column(width = 4,solidHeader = TRUE,
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong("Este item apresenta as principais Taxas de Mortalidade por Sinistros de Trânsito.")),
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong(" 1) Taxa de Mortalidade/Habitantes: A taxa de mortalidade por sinistro de trânsito é o número de óbitos por sinistros de transporte terreste, por 100 mil habitantes, na população residente do espaço geográfico, no ano considerado.") ,
                         tags$br(),
                         withMathJax(),
                         helpText('$$ Taxa \\ de \\ Óbito_{(habitantes)} =   \\left[ \\frac{Nº \\ de \\ Óbitos }{ Nº \\ de \\ habitantes} \\right]  \\times  100 \\  mil \\ (habitantes.)  $$')),
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong("")),
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong(" 2) Taxa de Mortalidade/Veículos: A taxa de mortalidade por veículos é o número de óbitos por sinistros de transporte terreste, por 10 mil Veículos, na frora veicular registrada do espaço geográfico, no ano considerado.") ,
                         tags$br(),
                         withMathJax(),
                         helpText('$$ Taxa \\ de \\ Óbito_{(veículos)} = \\left[ \\frac{Nº \\ de \\ Óbitos }{ Nº \\ de \\ Veículos} \\right]  \\times  \\ 10 \\ mil \\ (veículos.) $$'),)
           ),
           column(
             width = 4,
             tags$br(),
             tags$p(style="text-align:justify;font-si20pt",
                    strong("")),
             tags$br(),
             tags$p(style="text-align:justify;font-si20pt",
                    strong(" 3) Taxa de Motorização: A taxa de motorização é uma medida que relaciona o número de veículos motorizados (geralmente automóveis) com a população ou o número de habitantes em uma determinada área.") ,
                    tags$br(),
                    withMathJax(),
                    helpText('$$ Taxa \\ de \\ Motorização = \\left[ \\frac{Nº \\ de \\ Veículos \\ Motorizados }{Nº \\ de \\ habitantes} \\right]  \\times  \\ 100 \\ (habitantes) $$'),),
             tags$br(),
             tags$p(style="text-align:justify;font-si20pt",
                    strong("4) Taxa de Crescimento: A taxa de crescimento da frota de veículos pode ser calculada usando a seguinte fórmula:") ,
                    tags$br(),
                    withMathJax(),
                    helpText('$$ Taxa \\ de \\ Crescimento = \\left[ \\frac{(Frota \\ Final) - (Frota \\ Inicial) }{Frota \\ inicial} \\right]  \\times  \\ 100 \\ (habitantes) $$'),),
             tags$br(),
             tags$p(style="text-align:justify;font-si20pt",
                    strong("5) Taxa de Internação Hospitalar: A taxa de internação hospitalar é o número de casos de internação pagas no Sistema Ùnico de Saúde por acidentes de trânsito, por 10 mil habitantes, na população residente do espaço geográfico, no ano considerado.") ,
                    tags$br(),
                    withMathJax(),
                    helpText('$$ Taxa \\ de \\ Internação = \\left[ \\frac{(Nº \\ de \\ Internações)}{Nº \\ de \\ habitantes} \\right]  \\times  \\ 10 \\ mill \\ (habitantes) $$'),)
           )
         )
),
#===============================================================================#
tabPanel("CONVENÇÕES", icon = icon("landmark"),
         fluidRow(
           column(width=4,
                  solidHeader = TRUE,
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong("O Sistema segue a orientação das Normas da ABNT - NBR 10697.")),
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong("(-): Dado numérico igual a zero não resultante de arredondamento;")),
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong("NI: Referem-se aos acidentes, vítimas ou atributos não informados.")),
                  tags$br(),
                  tags$p(style="text-align:justify;font-si20pt",
                         strong("(…): Dado numérico não disponível."))
           )
         )
),
        )
),
#===============================================================================#
tabItem(tabName = "anuario", fluidRow()),
tabItem(tabName = "microdados", fluidRow(microdados_ui("microdados"))),
tabItem(tabName = "socioeconomico", fluidRow(socioeconomico_ui("socioeconomico"))),
tabItem(tabName = "condicao_da_vitima", fluidRow(cond_vitima_ui("cond_vitima"))),
tabItem(tabName = "ocorrencias", fluidRow(ocorrencia_ui("ocorrencia"))),
tabItem(tabName = "custo_hospitalar", fluidRow(custo_hospitalar_ui("custo_hospitalar"))),
tabItem(tabName = "localizacao", fluidRow(localizacao_ui("localizacao"))),
tabItem(tabName = "pictogramas", fluidRow(pictogramas_ui("pictogramas"))),
tabItem(tabName = "taxas1", fluidRow(taxas1_ui("taxas1"))),
tabItem(tabName = "taxas2", fluidRow(taxas2_ui("taxas2"))),
tabItem(tabName = "taxas3", fluidRow(taxas3_ui("taxas3"))),
tabItem(tabName = "taxas4", fluidRow(taxas4_ui("taxas4")))
      )
#===============================================================================#
    ),
footer = dashboardFooter(
  left = tags$b("DETRAN-PA"), 
  right = tags$b("Belém-PA, 2024 v.1")
),
title = "Dashboard"
  ),  
#===============================================================================#
#Servidor 
server <- function(input, output, session) {
  
  # Incrementa o contador de acessos cada vez que o aplicativo é carregado
  #contador_acessos = 0
  #contador_acessos = contador_acessos + 1
  
  # Atualiza dinamicamente o valueBox com o contador de acessos
  #output$contador_acessos <- renderValueBox({
  #  valueBox(
  #    value = contador_acessos,
  #    subtitle = "Número de Acessos",
  #    icon = icon("user"),
  #    color = "green"
  #  )
  #})
  #===============================================================================#
  detran_location <- data.frame(
    lat = -1.37843,  # Substitua pelo valor correto da latitude
    lon = -48.44034  # Substitua pelo valor correto da longitude
  )
  output$mapa <- renderLeaflet({
    df <- read.csv(textConnection("Nome,lat,lon, 
                              DETRAN-PA, -1.37843,-48.44034"))
    
    leaflet(df) %>% 
      addTiles() %>%
      addMarkers(~lon, ~lat, label = ~htmlEscape(Nome),
                 labelOptions = labelOptions(noHide = FALSE, 
                                             textsize = "15px")
      )%>%
      #leaflet(options = leafletOptions(minZoom = 0, maxZoom = 18)) %>%
      #addProviderTiles(providers$Esri.WorldStreetMap)%>%
      addProviderTiles(providers$OpenSeaMap)%>%
      setView(lng = detran_location$lon, 
              lat = detran_location$lat, 
              zoom = 15) 
    #addMarkers(
    #           lng = detran_location$lon, 
    #           lat = detran_location$lat,
    #           popup = "DETRAN-PA"
    #           ) %>% 
    #addCircleMarkers()
    
  })
  #===============================================================================#
  microdados_Server("microdados")
  socioeconomico_Server("socioeconomico")
  cond_vitima_Server("cond_vitima")
  ocorrencia_Server("ocorrencia")
  custo_hospitalar_Server("custo_hospitalar")
  localizacao_Server("localizacao")
  pictogramas_Server("pictogramas")
  taxas1_Server("taxas1")
  taxas2_Server("taxas2")
  taxas3_Server("taxas3")
  taxas4_Server("taxas4")
}
)
#===============================================================================#


#devtools::install_github("curso-r/basesCursoR")

