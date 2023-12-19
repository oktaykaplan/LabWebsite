library(shiny)
library(shinyjs)

ui <- fluidPage(
  shinyjs::useShinyjs(),  # Initialize shinyjs
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "styles.css"),
    tags$style(HTML("
      .home-photo {
        width: 1250px;
        height: 400px;
        object-fit: cover;
        margin-bottom: 60px;
      }
      .alumni-section {
        clear: both;
        margin-top: 20px; /* You can adjust this margin to control the spacing */
      }
      .nav-tabs > li > a {
        font-size: 20px !important; /* Adjust the font size as needed */
      }
      .tab-content {
        margin-top: 20px;
      }
      .team-photo {
        width: 200px;
        height: 200px;
        border-radius: 50%;
        object-fit: cover;
      }
      .team-container {
        display: flex;
        flex-direction: column;
        align-items: center;
      }
      .team-name {
        font-weight: bold;
        text-align: center;
      }
      .gif-container {
        display: flex;
        justify-content: center;
        flex-direction: column;  /* Change flex direction to column */
        align-items: center;  /* Center align items */
      }
      .navbar {
        display: flex;
        justify-content: center;
      }
      .main-header .navbar {
        background-color: #333;
      }
      #ResearchHeading {
        font-size: 30px;
        font-weight: bold;
        color: lightblue;
      }
      .lab-resources-content a {
        font-size: 25px;
        color: blue;
      }
      #LabResourcesHeading {
        font-size: 40px;
        font-weight: bold;
        color: lightblue;
      }
      .lab-resources-content:before {
        content: '\\2022'; /* Unicode character for bullet point */
        margin-right: 10px; /* Adjust margin for spacing between bullet and text */
        font-size: 30px; /* Adjust font size of the bullet */
      }
      /* Other existing styles... */

    /* New styles for the logo */
    #logo-container {
      position: absolute;
      top: 0px;
      right: 0px;
      max-height: 50px;
    }
    "))
  ),
  tags$div(
    id = "logo-container",
    tags$img(
      src = "logo.png",
      style = "max-height: 50px; position: absolute; top: 0px; right: 0px;"
    )
  ),
  tabsetPanel(
    tabPanel("Home",
             fluidPage(
               tags$style(".tab-content { max-width: 800px; margin: auto; }"),
               h2("Welcome to our website!", style = "font-weight: bold; color: lightblue;"),
               div(class = "gif-container",
                   img(src = "figure3.png", width = "150%"),
                   br(),  # Add a line break for space
                   h2("News", style = "font-weight: bold; color: lightblue;"),
                   # Use HTML for scrolling news
                   HTML("<marquee direction='left' behavior='scroll' scrollamount='5' style='font-weight: bold; color: black; font-size: 18px;'>
            Congratulations to Ferhan Yenisert on successfully passing her PhD qualification exam! 
            Many congratulations to Sebiha and Oktay for securing TUSEB funding!  Congratulations to Merve on her MSc defense and the commencement of her PhD studies at Tübingen, Germany!</marquee>")
               )
             )
    ),
    tabPanel("Research",
             fluidPage(
               tags$style(".tab-content { text-align: justify; }"),  # Justify text
               h2("Research", id = "ResearchHeading", style = "font-weight: bold; color: lightblue; text-align: center;"),
               selectInput("researchDropdown", label = NULL,
                           choices = c("Cilia Gene Discovery", "Matching Variants"),
                           selected = NULL, multiple = FALSE, selectize = FALSE),
               conditionalPanel(
                 condition = "input.researchDropdown == 'Cilia Gene Discovery'",
                 div(
                   h2("Utilizing Bioinformatics to Uncover Novel Ciliary Genes", style = "font-weight: bold; color: lightblue; text-align: center;"),
                   div(class = "gif-container",
                       img(src = "STAR_protocol.gif", width = "80%", style = "display: block; margin: auto;"),
                   ),
                   p("Our lab is primarily focused on unraveling the molecular mechanisms of rare diseases, with a specific emphasis on ciliopathies, a group of disorders associated with cilia dysfunction. The primary objectives of our lab are twofold: firstly, the identification of novel ciliary genes, and secondly, the exploration of the molecular consequences of genetic variations in ciliopathies.", style = "font-size: 16px;"),
                   p("To achieve the first objective, we have employed a multidisciplinary bioinformatic approach, incorporating techniques such as single-cell RNA-sequencing, comparative genomics, protein-protein interactions, text mining, and analysis of transcription factor motifs. This effort has led to the establishment of CilioGenics (",
                     a("https://ciliogenics.com/", href = "https://ciliogenics.com/", style = "color: blue;", target = "_blank"),
                     "), a comprehensive cilia database designed to benefit the cilia community. Notably, our work has successfully confirmed the ciliary involvement of several previously uncharacterized genes, including WDR31, ELMOD3, TTC39A, TMEM145, ZNF474, WDR54, and ZC2HC1A, as novel ciliary genes (Pir et al., Preprint; Turan MG et al., 2023, Database, Cevik S et al., 2023, Life Science Alliance).", style = "font-size: 16px;"),
                   p("Our lab is committed to open science, and we openly share our protocols and bioinformatics pipelines to contribute to the broader scientific community. We believe that collaboration and transparency are essential for advancing our understanding of rare diseases.", style = "font-size: 16px;"),
                   h3("Key Research Areas:", style = "font-weight: bold; color: lightblue;"),
                   p("1. Identification of novel ciliary genes implicated in ciliopathies.", style = "font-size: 16px;"),
                   p("2. Functional characterization of genes associated with ciliopathies.", style = "font-size: 16px;")
                 )
               ),
               conditionalPanel(
                 condition = "input.researchDropdown == 'Matching Variants'",
                 div(
                   h2("Integrative Bioinformatics Approaches for Variant Analysis", style = "font-weight: bold; color: lightblue; text-align: center;"),
                   div(class = "gif-container",
                       img(src = "STAR_protocol.gif", width = "80%", style = "display: block; margin: auto;"),
                   ),
                   p("The functional significance of the majority of human genetic variants (750 million) are still categorized as Variant of Uncertain Significance (VUS). Figuring out the relevance of these mutations is essential for accurate disease diagnosis. Understanding the functional implications of genetic variations is the focus of our second goal.", style = "font-size: 16px;"),
                   p("To address this challenge, we have matched variants called Matching Variants (MatchVars) from humans, C. elegans, and mice with variant-associated annotations, including pathogenicity and phenotypic data. Subsequently, we established a search engine named ConVarT specifically designed for clinical scientists. This search engine (",
                     a("https://convart.org/", href = "https://convart.org/", style = "color: blue;", target = "_blank"),
                     ") enables users to explore variant-specific information from humans, mice and C. elegans, aiding in the prediction of variant consequences (Pir et al., 2022, Nucleic Acids Research). For this work, we developed a visualization tool (Torun et al., 2021, Bioinformatics Advances | Oxford). We are presently expanding upon the initial work, incorporating variants from additional organisms such as Zebrafish, Drosophila, Cow, and Dogs.", style = "font-size: 16px;"), 
                   p("We have also been using the available mutants bearing MatchVars and CRISPR/Cas9 to examine the functional effects of specific variants in C. elegans. Our work has resulted in the identification of the functional consequences of variants in genes such as COL6A5, LRP1, CFTR, MTHFR, and more.", style = "font-size: 16px;"),
                   h3("Key Research Areas:", style = "font-weight: bold; color: lightblue;"),
                   p("1. Integrative analysis of genetic variants and their functional consequences.", style = "font-size: 16px;"),
                   p("2. Development of bioinformatics tools to aid variant interpretation in clinical settings.", style = "font-size: 16px;")
                 )
               )
             )
    ),
    tabPanel("Team", 
             fluidPage(
               tags$style(".tab-content { text-align: justify; }"),  # Justify text
               h2("Team", id = "TeamHeading", style = "font-weight: bold; color: lightblue; text-align: center;"),
               
               # Dropdown for Team
               selectInput("teamDropdown", label = "Select Team Members",
                           choices = c("Current Team Members", "Alumni"),
                           selected = NULL, multiple = FALSE, selectize = FALSE),
               
               conditionalPanel(
                 condition = "input.teamDropdown == 'Current Team Members'",
                 div(
                   h2("Cilia and Bioinformatics Team Members", style = "font-weight: bold; color: lightblue;"),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "Oktay.png", class = "team-photo"),
                            HTML("<p class='team-name'>Oktay I. Kaplan</p>")
                          )
                   ),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "sebihacevikaplan.png", class = "team-photo"),
                            HTML("<p class='team-name'>Sebiha Cevik</p>")
                          )
                   ),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "elegans.png", class = "team-photo"),
                            HTML("<p class='team-name'>Ferhan Yenisert<br/><strong>PhD student</strong></p>")
                          )
                   ),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "elegans.png", class = "team-photo"),
                            HTML("<p class='team-name'>Fatma Nihal Yetgin<br/><strong>Graduate student</strong></p>")
                          )
                   ),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "elegans.png", class = "team-photo"),
                            HTML("<p class='team-name'>Fatma Guzel<br/><strong>Graduate student</strong></p>")
                          )
                   ),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "elegans.png", class = "team-photo"),
                            HTML("<p class='team-name'>Sinem Guzel<br/><strong>Graduate student</strong></p>")
                          )
                   ),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "elegans.png", class = "team-photo"),
                            HTML("<p class='team-name'>Hasan Can Demirci<br/><strong>Bioinformatician</strong></p>")
                          )
                   ),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "elegans.png", class = "team-photo"),
                            HTML("<p class='team-name'>Mustafa Emre Korkmaz<br/><strong>Bioinformatician</strong></p>")
                          )
                   )
                 )
               ),
               
               conditionalPanel(
                 condition = "input.teamDropdown == 'Alumni'",
                 div(
                   h2("Alumni", class = "alumni-section", style = "font-weight: bold; color: lightblue;"), 
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "elegans.png", class = "team-photo"),  # Add image for alumni
                            HTML("<p class='team-name'>Merve Gul Turan<br/><strong>Current Position: PhD student at Max Planck Institute, Tübingen, Germany</strong></p>")
                          )
                   ),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "elegans.png", class = "team-photo"),  # Add image for alumni
                            HTML("<p class='team-name'>Mustafa Samet Pir<br/><strong>Current Position: PhD student at Acıbadem Üniversity, Istanbul, Turkiye</strong></p>")
                          )
                   ),
                   column(width = 4,
                          div(
                            class = "team-container",
                            img(src = "elegans.png", class = "team-photo"),  # Add image for alumni
                            HTML("<p class='team-name'>Furkan Ziya Zorluer<br/><strong>Current Position: PhD student at Abdullah Gül Üniversity, Istanbul, Turkiye</strong></p>")
                          )
                   )
                 )
               )
             )
    ),
    tabPanel("Publications", 
             fluidPage(
               h2("Preprints", style = "font-weight: bold; color: lightblue;"),
               p(
                 HTML("Mustafa S. Pir, Ferhan Yenisert, Aslı Karaman, Efe Begar, Sofia Tsiropoulou, Elif Nur Firat-Karalar, Oliver E Blacque, Sukru S. Oner, Osman Doluca, Sebiha Cevik, Oktay I. Kaplan, 
                        <a href='https://doi.org/10.1093/g3journal/jkad227' style='color: blue;' target='_blank'>
                          CilioGenics: an integrated method and database for predicting novel ciliary genes
                        </a>, 
                        <strong>Under Review</strong>, bioRxiv 2023.03.31.535034; doi: https://doi.org/10.1101/2023.03.31.535034")
               ),
               h2("Publications", style = "font-weight: bold; color: lightblue;"),
               h2("2023"),
               p(
                 HTML("Sebiha Cevik, Pei Zhao, Atiyye Zorluer, Mustafa S Pir, Wenyin Bian, Oktay I Kaplan, 
                        <a href='https://doi.org/10.1093/g3journal/jkad227' style='color: blue;' target='_blank'>
                          Matching variants for functional characterization of genetic variants
                        </a>, 
                        <strong>G3 Genes|Genomes|Genetics</strong>, 2023;, jkad227")
               ),
               p(
                 HTML("Merve Gül Turan, Mehmet Emin Orhan, Sebiha Cevik, Oktay I Kaplan, 
                        <a href='https://doi.org/10.1093/database/baad047' style='color: blue;' target='_blank'>
                          CiliaMiner: an integrated database for ciliopathy genes and ciliopathies
                        </a>, 
                        <strong>Database</strong>, Volume, baad047")
               ),
               p(
                 HTML("Oktay I Kaplan, 
                        <a href='https://journals.tubitak.gov.tr/biology/vol47/iss1/7/' style='color: blue;' target='_blank'>
                          RPI-1 (human DCDC2) displays functional redundancy with Nephronophthisis 4 in regulating cilia biogenesis in C. elegans
                        </a>, 
                        <strong>Turk J Biol.</strong>, 47(1):74-83.PMID: 37529113; PMCID: PMC10388106.7")
               ),
               p(
                 HTML("Sebiha Cevik, Xiaoyu Peng, Tina Beyer, Mustafa S Pir, Ferhan Yenisert, Franziska Woerz, Felix Hoffmann, Betul Altunkaynak, Betul Pir, Karsten Boldt, Asli Karaman, Miray Cakiroglu, S Sadik Oner, Ying Cao, Marius Ueffing, Oktay I Kaplan, 
                        <a href='https://www.life-science-alliance.org/content/6/8/e202201844' style='color: blue;' target='_blank'>
                          WDR31 displays functional redundancy with GTPase-activating proteins (GAPs) ELMOD and RP2 in regulating IFT complex and recruiting the BBSome to cilium
                        </a>, 
                        <strong>Life Science Alliance</strong>. 6(8):e202201844. PMID: 37208194; PMCID: PMC10200814.")
               ),
               h2("2022"),
               p(
                 HTML("Mustafa S Pir, Sebiha Cevik, Oktay I Kaplan,
                        <a href='https://currentprotocols.onlinelibrary.wiley.com/doi/10.1002/cpz1.619' style='color: blue;' target='_blank'>
                          ConVarT: Search Engine for Missense Variants Between Humans and Other Organisms
                        </a>, 
                        <strong>Current Protocols</strong>.;2(11):e619. PMID: 36413109.")
               ),
               p(
                 HTML("Merve G Turan, Hanife Kantarci, Sadiye D Temtek, Onur Cakici, Sebiha Cevik, Oktay I Kaplan, 
                        <a href='https://www.sciencedirect.com/science/article/pii/S2666166722003781?via%3Dihub' style='color: blue;' target='_blank'>
                          Protocol for determining the average speed and frequency of kinesin and dynein-driven intraflagellar transport (IFT) in C. elegans
                        </a>, 
                        <strong>STAR Protocols</strong>. :101498. PMID: 35776634; PMCID: PMC9250072.")
               ),
               p(
                 HTML("Mustafa S Pir, Halil I Bilgin, Ahmet Sayici, Fatih Coşkun, Furkan M Torun, Pei Zhao, Yahong Kang, Sebiha Cevik, Oktay I Kaplan, 
                        <a href='https://academic.oup.com/nar/article/50/D1/D1172/6413595?login=true' style='color: blue;' target='_blank'>
                          ConVarT: a search engine for matching human genetic variants with variants from non-human species
                        </a>, 
                        <strong>Nucleic Acids Research</strong>. Volume 50, Issue D1, 7 January 2022, Pages D1172–D1178,")
               ),
               h2("2021"),
               p(
                 HTML("Furkan M Torun, Halil I Bilgin, Oktay I Kaplan, 
                        <a href='https://academic.oup.com/bioinformaticsadvances/article/1/1/vbab009/6345340?login=true' style='color: blue;' target='_blank'>
                          MSABrowser: dynamic and fast visualization of sequence alignments, variations and annotations
                        </a>, 
                        <strong>Bioinformatics Advances</strong>. Volume 1, Issue 1, 2021, vbab009,")
               ),
               p(
                 HTML("Sebiha Cevik, Oktay I Kaplan, 
                        <a href='https://www.micropublication.org/journals/biology/micropub-biology-000406' style='color: blue;' target='_blank'>
                          The Joubert syndrome protein CEP41 is excluded from the distal segment of cilia in C. elegans
                        </a>, 
                        <strong>microPublication Biology</strong>. 10.17912/micropub.biology.000406.")
               ),
               p(
                 HTML("Sebiha Cevik, Oktay I Kaplan, 
                        <a href='https://www.micropublication.org/journals/biology/micropub-biology-000367' style='color: blue;' target='_blank'>
                          Subcellular localization of the voltage-gated K+ channel EGL-36 , a member of the KV3 subfamily, in the ciliated sensory neurons in C. elegans
                        </a>, 
                        <strong>microPublication Biology</strong>. 10.17912/micropub.biology.000367.")
               ),
               h2("2018"),
               p(
                 HTML("Yoshishige Kimura, Koji Tsutsumi, Alu Konno, Koji Ikegami, Saira Hameed, Tomomi Kaneko, Oktay Ismail Kaplan, Takayuki Teramoto, Manabi Fujiwara, Takeshi Ishihara, Oliver E Blacque, Mitsutoshi Setou, 
                        <a href='https://www.nature.com/articles/s41598-018-26694-w' style='color: blue;' target='_blank'>
                          Environmental responsiveness of tubulin glutamylation in sensory cilia is regulated by the p38 MAPK pathway
                        </a>, 
                        <strong>Scientific Reports</strong>. 8, 8392 (2018). https://doi.org/10.1038/s41598-018-26694-w")
               ),
               h2("2016"),
               p(
                 HTML("Oktay I Kaplan, Burak Berber, Nezih Hekim, Osman Doluca, 
                        <a href='https://academic.oup.com/nar/article/44/19/9083/2468430?login=true' style='color: blue;' target='_blank'>
                          G-quadruplex prediction in E. coli genome reveals a conserved putative G-quadruplex-Hairpin-Duplex switch
                        </a>, 
                        <strong>Nucleic Acids Researchs</strong>. Volume 44, Issue 19, 2 November 2016, Pages 9083–9095, https://doi.org/10.1093/nar/gkw769")
               ),
               h2("2013"),
               p(
                 HTML("Sebiha Cevik, Anna A W M Sanders, Erwin Van Wijk, Karsten Boldt, Lara Clarke, Jeroen van Reeuwijk, Yuji Hori, Nicola Horn, Lisette Hetterschijt, Anita Wdowicz, Andrea Mullins, Katarzyna Kida, Oktay I Kaplan, Sylvia E C van Beersum, Ka Man Wu, Stef J F Letteboer, Dorus A Mans, Toshiaki Katada, Kenji Kontani, Marius Ueffing, Ronald Roepman, Hannie Kremer, Oliver E Blacque, 
                        <a href='https://journals.plos.org/plosgenetics/article?id=10.1371/journal.pgen.1003977' style='color: blue;' target='_blank'>
                          Active transport and diffusion barriers restrict Joubert Syndrome-associated ARL13B/ARL-13 to an Inv-like ciliary membrane subdomain  
                        </a>, 
                        <strong>PLOS Genetics</strong>. e1003977. doi: 10.1371/journal.pgen.1003977. PMID: 24339792; PMCID: PMC3854969.")
               ),
               h2("2012"),
               p(
                 HTML("Oktay I Kaplan, David B Doroquez, Sebiha Cevik, Rachel V Bowie, Lara Clarke, Anna A W M Sanders, Katarzyna Kida, Joshua Z Rappoport, Piali Sengupta, Oliver E Blacque
                        <a href='https://www.sciencedirect.com/science/article/pii/S0960982212000905?via%3Dihub' style='color: blue;' target='_blank'>
                          Endocytosis genes facilitate protein and membrane transport in C. elegans sensory cilia  
                        </a>, 
                        <strong>Current Biology</strong>. 451-60. doi: 10.1016/j.cub.2012.01.060. PMID: 22342749; PMCID: PMC3678972.")
               ),
               h2("2010"),
               p(
                 HTML("Oktay I Kaplan, Anahi Molla-Herman, Sebiha Cevik, Rania Ghossoub, Katarzyna Kida, Yoshishige Kimura, Paul Jenkins, Jeffrey R Martens, Mitsutoshi Setou, Alexandre Benmerah, Oliver E Blacque
                        <a href='https://journals.biologists.com/jcs/article/123/22/3966/31369/The-AP-1-clathrin-adaptor-facilitates-cilium' style='color: blue;' target='_blank'>
                          The AP-1 clathrin adaptor facilitates cilium formation and functions with RAB-8 in C. elegans ciliary membrane transport  
                        </a>, 
                        <strong>Journal of Cell Science</strong>. 3966-77. doi: 10.1242/jcs.073908. PMID: 20980383; PMCID: PMC2972276.")
               ),
               p(
                 HTML("Yoshishige Kimura, Nobuya Kurabe, Koji Ikegami, Koji Tsutsumi, Yoshiyuki Konishi, Oktay Ismail Kaplan, Hirofumi Kunitomo, Yuichi Iino, Oliver E Blacque, Mitsutoshi Setou
                        <a href='https://www.sciencedirect.com/science/article/pii/S0021925820603350?via%3Dihub' style='color: blue;' target='_blank'>
                          Identification of tubulin deglutamylase among Caenorhabditis elegans and mammalian cytosolic carboxypeptidases (CCPs)
                        </a>, 
                        <strong>Journal of Biological Chemistry</strong>. 3966-77. doi: 10.1074/jbc.C110.128280. Epub 2010 Jun 2. PMID: 20519502; PMCID: PMC2906286.")
               ),
               p(
                 HTML("Sebiha Cevik, Yuji Hori, Oktay I Kaplan, Katarzyna Kida, Tiina Toivenon, Christian Foley-Fisher, David Cottell, Toshiaki Katada, Kenji Kontani, Oliver E Blacque
                        <a href='https://rupress.org/jcb/article/188/6/953/35756/Joubert-syndrome-Arl13b-functions-at-ciliary' style='color: blue;' target='_blank'>
                          Joubert syndrome Arl13b functions at ciliary membranes and stabilizes protein transport in Caenorhabditis elegans
                        </a>, 
                        <strong>Journal of Cell Biology</strong>.doi: 10.1083/jcb.200908133. Erratum in: J Cell Biol.;189(1):187. PMID: 20231383; PMCID: PMC2845074.")
               ),
               h2("2008"),
               p(
                 HTML("Oliver E Blacque, Sebiha Cevik, Oktay Ismail Kaplan
                        <a href='https://www.imrpress.com/journal/FBL/13/7/10.2741/2871' style='color: blue;' target='_blank'>
                          Intraflagellar transport: from molecular characterisation to mechanism
                        </a>, 
                        <strong>Frontiers in Bioscience-Landmark</strong>.2633-52. doi: 10.2741/2871. PMID: 17981739.")
               ),
             )
    ),
    tabPanel("Lab Resources", 
             fluidPage(
               h2("Lab Resources", id = "LabResourcesHeading"),
               p(
                 a("ConVarT", 
                   href = "https://convart.org/", style = "color: blue;", target = "_blank"),
                 class = "lab-resources-content"
               ),
               p(
                 a("CilioGenics", 
                   href = "https://ciliogenics.com/", style = "color: blue;", target = "_blank"),
                 class = "lab-resources-content"
               ),
               p(
                 a("CiliaMiner", 
                   href = "https://kaplanlab.shinyapps.io/ciliaminer/", style = "color: blue;", target = "_blank"),
                 class = "lab-resources-content"
               ),
               p(
                 a("GitHub", 
                   href = "https://github.com/thekaplanlab", style = "color: blue;", target = "_blank"),
                 class = "lab-resources-content"
               )
             )
    ),
    tabPanel("Contact", fluidPage(
      h2("Get in touch with us", style = "font-weight: bold; color: lightblue;"),
      p("Oktay I. Kaplan, Dr.", style = "font-size: 16px;"),
      p("School of Life and Natural Sciences", style = "font-size: 16px;"),
      p("AGU, Kayseri, Turkey", style = "font-size: 16px;"),
      p(style = "font-size: 16px; font-weight: bold;", 
        HTML("Twitter: <strong><a href='https://twitter.com/KaplanOLab' style='color: blue;' target='_blank'>KaplanOLab</a></strong>")),
      p(style = "font-size: 16px; font-weight: bold;", 
        HTML("E-mail: <strong><a href='mailto:oktay.kaplan@agu.edu.tr' style='color: blue;' target='_blank'>oktay.kaplan (at) agu.edu.tr</a></strong>"))
    ))
  )
)

shinyApp(ui, server = function(input, output) {})
