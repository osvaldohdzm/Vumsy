def serializeDict(a) -> dict:
    return {**{i: str(a[i]) for i in a if i == '_id'}, **{i: a[i] for i in a if i != '_id'}}


def serializeList(entity) -> list:
    return [serializeDict(a) for a in entity]


def wdaDict(item):
    data = {
        "<<analysis_id>>": item.analysis_id,
        "<<analysis_revision_01>>": item.analysis_revision_01,
        "<<analysis_version_format_01>>": item.analysis_version_format_01,
        "<<analysis_version_format_02>>": item.analysis_version_format_02,
        "<<app_url>>": item.app_url,
        "<<date_format_01>>": item.date_format_01,
        "<<date_format_02>>": item.date_format_02,
        "<<date_format_02>>": item.date_format_02,        
        "<<due_date>>": item.due_date,
        "<<executive_resume>>": item.executive_resume,
        "<<finish_date>>": item.finish_date,
        "<<name_app>>": item.name_app,
        "<<no_targets>>": item.no_targets,
        "<<reporter_01>>": item.reporter_01,
        "<<request_date_format_01>>":item.request_date_format_01,
        "<<request_folio>>": item.request_folio,
        "<<responsible_01>>": item.responsible_01,
        "<<responsible_charge_01>>": item.responsible_charge_01,
        "<<scope_description_01>>": item.scope_description_01,
        "<<scope_ip_01>>": item.scope_ip_01,
        "<<scope_operative_system_01>>":item.scope_operative_system_01,
        "<<scope_url_01>>": item.scope_url_01,
        "<<start_date>>": item.start_date,
        "<<start_date_planned>>": item.start_date_planned,
        "<<template_name>>": item.template_name,
        "<<reviewer_01>>": item.reviewer_01,
        "<<vulnerabilities>>": []
    }
    
    for element in item.vulnerabilities:
        vulnerability = {}
        evidence = {}
        print(element)
        vulnerability["<<vulnerability_name>>"] = element.vulnerability_name
        vulnerability["<<vulnerability_cwe>>"] = element.vulnerability_cwe        
        vulnerability["<<vulnerability_cvss>>"] = element.vulnerability_cvss
        vulnerability["<<vulnerability_ocurrences>>"] = element.vulnerability_ocurrences
        vulnerability["<<vulnerability_clasification>>"] = element.vulnerability_clasification
        vulnerability["<<vulnerability_ip>>"] = element.vulnerability_ip
        vulnerability["<<vulnerability_ports>>"] = element.vulnerability_ports
        vulnerability["<<vulnerability_risk_score>>"] = element.vulnerability_risk_score
        vulnerability["<<vulnerability_risk>>"] = element.vulnerability_risk
        vulnerability["<<vulnerability_description>>"] = element.vulnerability_description
        vulnerability["<<vulnerability_remediation>>"] = element.vulnerability_remediation
        vulnerability["<<vulnerability_references>>"] = element.vulnerability_references
        vulnerability["<<vulnerability_path>>"] = element.vulnerability_path
        vulnerability["<<vulnerability_evidences>>"] = []
        for subelement in element.vulnerability_evidences:
            evidence["<<vulnerability_evidence_image_path>>"] = subelement.vulnerability_evidence_image_path
            evidence["<<vulnerability_evidence_note>>"] = subelement.vulnerability_evidence_note
            vulnerability["<<vulnerability_evidences>>"].append(evidence)
        data["<<vulnerabilities>>"].append(vulnerability)

    return data
