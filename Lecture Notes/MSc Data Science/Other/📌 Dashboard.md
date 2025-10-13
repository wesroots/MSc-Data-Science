---
cssclasses: dashboard
---
>[!note] Important
>```dataviewjs
const name = window.moment().format("ddd Do MMM");
dv.paragraph(dv.fileLink("-- Daily Notes --/" + name, false, "Open today's note"));
>```
>[[Employability Overview]]
## Modules
- **MAST7866 - Foundations of Data Science**
	- [[MAST7866 - Foundations of Data Science/-- IMPORTANT --/Module Overview|Module Overview]]
	- [[MAST7866 - Foundations of Data Science/-- IMPORTANT --/Assessments|Assessments]]
- **COMP7023 - Python Programming**
	- [[COMP7023 - Python Programming/-- IMPORTANT --/Module Overview|Module Overview]]
	- [[COMP7023 - Python Programming/-- IMPORTANT --/Assessments|Assessments]]

## Vault Info
- 🗄️ Recent file updates `$=dv.list(dv.pages('').sort(f=>f.file.mtime.ts,"desc").limit(5).file.link)`
- 🚩 Flagged `$=dv.list(dv.pages('#flagged_for_revision').sort(f=>f.file.name,"desc").limit(4).file.link)`
- 〽️ Stats
    - File Count: `$=dv.pages().length`
