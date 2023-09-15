defmodule ChGenElixirTest do
  use ExUnit.Case

  describe "correctly parsing generals" do
    test "it parses /g/ correctly" do
      out =
        File.read!("test/fixtures/g_catalog.json")
        |> Jason.decode!(keys: :atoms)
        |> ChGenElixir.parse_general(:g)

      assert length(Map.keys(out)) === 24

      assert out === %{
               "aicg" => "https://boards.4chan.org/g/thread/91796757",
               "csg" => "https://boards.4chan.org/g/thread/91783195",
               "dmp" => "https://boards.4chan.org/g/thread/91739130",
               "dpt" => "https://boards.4chan.org/g/thread/91783921",
               "fglt" => "https://boards.4chan.org/g/thread/91776726",
               "fwt" => "https://boards.4chan.org/g/thread/91776338",
               "hsg" => "https://boards.4chan.org/g/thread/91719411",
               "lol" => "https://boards.4chan.org/g/thread/91784179",
               "psg" => "https://boards.4chan.org/g/thread/91698417",
               "ptg" => "https://boards.4chan.org/g/thread/91785374",
               "sdg" => "https://boards.4chan.org/g/thread/91797612",
               "spg" => "https://boards.4chan.org/g/thread/91786874",
               "sqt" => "https://boards.4chan.org/g/thread/91779681",
               "tpg" => "https://boards.4chan.org/g/thread/91735470",
               "twg" => "https://boards.4chan.org/g/thread/91796282",
               "wdg" => "https://boards.4chan.org/g/thread/91798719",
               "aosg" => "https://boards.4chan.org/g/thread/91776271",
               "g" => "https://boards.4chan.org/g/thread/91791556",
               "hpg" => "https://boards.4chan.org/g/thread/91756411",
               "iemg" => "https://boards.4chan.org/g/thread/91786160",
               "mg" => "https://boards.4chan.org/g/thread/91799877",
               "ppg" => "https://boards.4chan.org/g/thread/91774261",
               "reg" => "https://boards.4chan.org/g/thread/91766468",
               "vsg" => "https://boards.4chan.org/g/thread/91774292"
             }
    end

    test "it parses /fit/ correctly" do
      out =
        File.read!("test/fixtures/fit_catalog.json")
        |> Jason.decode!(keys: :atoms)
        |> ChGenElixir.parse_general(:fit)

      assert length(Map.keys(out)) === 7

      assert out === %{
               "cbt" => "https://boards.4chan.org/fit/thread/70107935",
               "fast" => "https://boards.4chan.org/fit/thread/70093022",
               "fat" => "https://boards.4chan.org/fit/thread/70095556",
               "fit" => "https://boards.4chan.org/fit/thread/70090055",
               "plg" => "https://boards.4chan.org/fit/thread/70106453",
               "run" => "https://boards.4chan.org/fit/thread/70094867",
               "sig" => "https://boards.4chan.org/fit/thread/70106720"
             }
    end

    test "it parses /biz/ correctly" do
      out =
        File.read!("test/fixtures/biz_catalog.json")
        |> Jason.decode!(keys: :atoms)
        |> ChGenElixir.parse_general(:biz)

      assert length(Map.keys(out)) === 14

      assert out === %{
               "avax" => "https://boards.4chan.org/biz/thread/53875034",
               "bbby" => "https://boards.4chan.org/biz/thread/53870970",
               "biz" => "https://boards.4chan.org/biz/thread/53874478",
               "cmmg" => "https://boards.4chan.org/biz/thread/53859927",
               "freelancer" => "https://boards.4chan.org/biz/thread/53876288",
               "gme" => "https://boards.4chan.org/biz/thread/53872531",
               "jpeg" => "https://boards.4chan.org/biz/thread/53870263",
               "pmg" => "https://boards.4chan.org/biz/thread/53873650",
               "smg" => "https://boards.4chan.org/biz/thread/53873999",
               "tlcg" => "https://boards.4chan.org/biz/thread/53830995",
               "trawlerai" => "https://boards.4chan.org/biz/thread/53875527",
               "wfh" => "https://boards.4chan.org/biz/thread/53872268",
               "xmr" => "https://boards.4chan.org/biz/thread/53856396",
               "xsg" => "https://boards.4chan.org/biz/thread/53848706"
             }
    end
  end
end
