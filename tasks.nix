{ mkTask, ... }:
{
  share = mkTask {
    description = "Task from shared library";
    run = ''bold_green "Hello from shared library!"'';
  };
}
