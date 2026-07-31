{ ... }:

{
  # Grants GameMode permission to modify kernel sysctl parameters (like split-lock mitigation)
  # without requiring a password prompt from users in the 'gamemode' group.
  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (action.id == "com.feralinteractive.GameMode.procsysctl" && subject.isInGroup("gamemode")) {
        return polkit.Result.YES;
      }
    });
  '';
}
