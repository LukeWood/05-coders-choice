Path.join(["rel", "plugins", "*.exs"])
|> Path.wildcard()
|> Enum.map(&Code.eval_file(&1))

use Mix.Releases.Config,
    default_release: :default,
    default_environment: Mix.env()

environment :dev do
  set dev_mode: true
  set include_erts: true
  set cookie: :"F5uLmME4Y=}oIDw`&Qw8fSnt`TtTqt`oTXJrN5;f?V?bR{ayz$YI{Py`>F<%(bBR"
end

environment :prod do
  set include_erts: true
  set include_src: false
  set cookie: :"?[$Fol/MR%uxBVdzU47~I?Afnt_~j]la^LP=DfSe|f>O:6;{@A$@,t/<J;RS*4A%"
end


release :client do
  set version: current_version(:client)
  set applications: [
    :runtime_tools,
    :mix
  ]
end
