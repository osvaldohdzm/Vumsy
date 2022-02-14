class Scope {
  final String targetDescription;
  final String targetIp;
  final String targetUrl;
  final String targetOperativeSystem;

  Scope(this.targetDescription, this.targetIp, this.targetUrl,
      this.targetOperativeSystem);

  Map<String, dynamic> toJson() => {
        "<<target_description>>": targetDescription,
        "<<target_ip>>": targetIp,
        "<<target_url>>": targetUrl,
        "<<target_operative_system>>": targetOperativeSystem
      };
}
