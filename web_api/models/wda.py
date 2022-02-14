from pydantic import BaseModel
from typing import List
import json

class Evidence(BaseModel):
    vulnerability_evidence_image_path: str 
    vulnerability_evidence_note: str

class Vulnerability(BaseModel):
    vulnerability_name: str
    vulnerability_risk_score: str
    vulnerability_cwe: str
    vulnerability_cvss: str
    vulnerability_ocurrences: str
    vulnerability_clasification: str
    vulnerability_ip: str
    vulnerability_ports: str
    vulnerability_risk: str
    vulnerability_description: str
    vulnerability_remediation: str
    vulnerability_references: str
    vulnerability_path: str
    vulnerability_evidences: List[Evidence] 

class VulnerabilityAnalisis(BaseModel):
    template_name : str
    name_app : str
    analysis_id : str
    request_folio : str
    request_date_format_01 : str
    start_date_planned : str
    start_date : str
    due_date : str
    finish_date : str
    date_format_01 : str
    date_format_02 : str
    analysis_revision_01 : str
    analysis_version_format_01 : str
    analysis_version_format_02 : str
    previous_analysis_version_format_03 : str
    app_url : str
    no_targets : str
    reporter_01 : str
    reviewer_01 : str
    responsible_01 : str
    responsible_charge_01 : str
    scope_url_01 : str
    scope_description_01 : str
    scope_ip_01 : str
    scope_operative_system_01 : str
    executive_resume : str
    vulnerabilities: List[Vulnerability] 

    def toJSON(self):
        return json.dumps(self, default=lambda o: o.__dict__, 
            sort_keys=True, indent=4)