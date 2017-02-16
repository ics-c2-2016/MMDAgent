#wether
0 1 <eps>                               VALUE_EVAL|wether|EQ|1
1 2 VALUE_EVENT_EVAL|wether|EQ|1|TRUE   SYNTH_START|mei|mei_voice_normal|このあと、-3.02度になるみたいですよ。
1 0 VALUE_EVENT_EVAL|wether|EQ|1|FALSE  <eps>
2 3 SYNTH_EVENT_STOP|mei                SYNTH_START|mei|mei_voice_normal|寒いですねー。
3 4 SYNTH_EVENT_STOP|mei                VALUE_SET|wether|0
4 0 VALUE_EVENT_SET|wether              VALUE_SET|fin|1