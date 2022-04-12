# philsf.workflow (development version)

* Scripts were not updated after API change #173

# philsf.workflow 0.15.0

* install without changing file attributes #147
* Auto create document templates when creating a SAR repo #36
* check argument in SAR-links #148
* private data by default #152
* initialize dataset private repo by default #154
* new document tags/categories #161
* Use new gtsummary theme in scripts #157
* Call SAR-links automatically upon repo creation #158
* New template for future availability #160
* New sections in SAP #159
* Create script to update doc templates to be installed in new repos #169
* SAR-rename should rename all relevant files into git #163
* Remove ".sh" from all scripts' names #156

# philsf.workflow 0.14.0

* account for N changes during cleaning procedures #143
* drop private version of reports #144
* add other interpretation templates from effectsizes pkg

# philsf.workflow 0.13.1

* scripts updates #139
* templates updates #140
* Don't switch to `github_document` #24

# philsf.workflow 0.13.0

* templates updates #131
* scripts updates (new gtsummary theme prototype) #132
* Portfolio item template #130
* SAR-links now prints usage when called with not args #109
* SAR-links can now update Portfolio links (substrings) #136

# philsf.workflow 0.12.0

* SAR-links now filters markdown files in report/ #108
* load `philsfmisc` in `input` #110
* Use current date as default #111
* Silence `results` script #118
* Var types are now identified by row in results tables #115
* paragraph spacing reduced in TOC styles #114
* template (non) availability for private analyses #113
* SAP structure enhancements #117
* SAP structure source declared and cited #116
* SAP now includes a section for handling missing data #112

# philsf.workflow 0.11.2

* Templates updated #100
* Scripts updated #101
* Substitute a string in select repo files #102
* use theme_ff() ggplot2 theme #107

# philsf.workflow 0.11.1

* ensure templates work on repo pages #96
* scripts default template adjustments #97

# philsf.workflow 0.11.0

* ignore strings updated #86
* template contentes updates #87
* use repositoty github pages #89
* template styles updates #88
* template scripts updates #90

# philsf.workflow 0.10.4

* include `scripts/` dir in the initial commit #78
* Fix figure file paths #75
* reduce pander table size to 160 (appropriate for small font) #77
* document links now jump to google docs viewer #82
* drop `pander` in favor of `kable` for results tables (still pander in data) #74
* Default document content in both languages #76

# philsf.workflow 0.10.3

* Ensure clean start for all scripts #70
* Minor fixes for document templates #71

# philsf.workflow 0.10.2

* fix README-SAR templates #68

# philsf.workflow 0.10.1

* Fix typo in SAP_pt #64
* Update README-SAR templates #63

# philsf.workflow 0.10.0

* Apply default repo README #14
* New document code #10
* New document template styles (now work in LibreOffice) #22
* Update scripts with new best practices #55
* Update templates with new best practices #56

# philsf.workflow 0.9.3

* Package now passes R checks #49
* Pre-include dataset/ in gitignore #35
* install now checks for Windows OS (git/MINGW32/MINGW64) #45

# philsf.workflow 0.9.2

* SAR repo README improved #46

# philsf.workflow 0.9.1

* Fixed path variables #38
* Translate scripts #7
* New optional list of SAR dirs to remote-all-set #41
* Consistent script filenames #37

# philsf.workflow 0.9.0

* Imported bash scripts from gitlab #1
* Imported SAR and SAP templates from philsfmisc #2
* Project converted to an R package #26
* default SAR repo README (pt) #3
* default SAR repo README (en) #4
* Multiple template styles allowed #23
* Document template headers updated #21
* Set pander tables to rmarkdown style #20
* New templates:
    * SAP-en #12
    * SAR-en #13
