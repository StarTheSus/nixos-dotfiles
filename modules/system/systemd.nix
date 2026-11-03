{ ... }:

{
  # Don't kill my ssd, I'm not rich.
  services.journald.settings.Journal.Storage = "volatile";
}
