defmodule DrabSpeedWeb.PageCommander do
  use Drab.Commander


### Event handlers

  ## COUNTER
    # Counter Example 1
    defhandler counter_1(socket, sender, action) do
      counter = peek!(socket, "main.html", :counter)
      new_counter =
        case action do
          "+" ->  counter + 1
          "-" ->  counter - 1
          "clear" -> 0
        end
      poke(socket, "main.html", counter: new_counter)
    end
    # Counter Example 2
    defhandler counter_2(socket, sender, action) do
      counter = peek!(socket, "_counter2.html", :counter)
      new_counter =
        case action do
          "+" ->  counter + 1
          "-" ->  counter - 1
          "clear" -> 0
        end
      poke(socket, "_counter2.html", counter: new_counter)
    end
    # Counter Example 3
    defhandler counter_3(socket, sender, action) do
      counter = peek!(socket, "_counter3.html", :counter)
      new_counter =
        case action do
          "+" ->  counter + 1
          "-" ->  counter - 1
          "clear" -> 0
        end
      html = render_to_string("_counter3.html", counter: new_counter)
      set_html(socket, "#counter-3", html)
    end


  ## COUNT DOWN
    # Count down Example 1
    defhandler count_down_1(socket, sender, time) do
      for i <- 1..time do
        poke socket, counter: time - i
      end
    end
    # Count down Example 2
    defhandler count_down_2(socket, sender, time) do
      for i <- 1..time do
        poke socket, "_counter2.html", counter: time - i
      end
    end
    # Count down Example 3
    defhandler count_down_3(socket, sender, time) do
      for i <- 1..time do
        html = render_to_string("_counter3.html", counter: time - i)
        set_html(socket, "#counter-3", html)
      end
    end


  ### SCROLL
    # Scroll Example 1
    defhandler scroll_1(socket, sender) do
      scroll_by_poke(socket, "main.html")
    end
    # Scroll Example 2
    defhandler scroll_2(socket, sender) do
      scroll_by_poke(socket, "_scroll2.html")
    end
    # Scroll Example 3
    defhandler scroll_3(socket, sender) do
      scroll_by_set_html(socket, "#scroll-3", "_scroll3.html")
    end

    def scroll_by_poke(socket, template_to_poke) do
      for i <- 1..3 do
        poke socket, template_to_poke, c1: "lightgreen"
        poke socket, template_to_poke, c1: "lightgray"
        poke socket, template_to_poke, c2: "lightgreen"
        poke socket, template_to_poke, c2: "lightgray"
        poke socket, template_to_poke, c3: "lightgreen"
        poke socket, template_to_poke, c3: "lightgray"
        poke socket, template_to_poke, c4: "lightgreen"
        poke socket, template_to_poke, c4: "lightgray"
        poke socket, template_to_poke, c5: "lightgreen"
        poke socket, template_to_poke, c5: "lightgray"
        poke socket, template_to_poke, c6: "lightgreen"
        poke socket, template_to_poke, c6: "lightgray"
      end
    end

    def scroll_by_set_html(socket, element_id_to_set, template_to_render) do
      for i <- 1..3 do
        html = render_to_string(template_to_render, c1: "lightgreen", c2: "lightgray", c3: "lightgray", c4: "lightgray", c5: "lightgray", c6: "lightgray")
        set_html(socket, element_id_to_set, html)

        html = render_to_string(template_to_render, c1: "lightgray", c2: "lightgreen", c3: "lightgray", c4: "lightgray", c5: "lightgray", c6: "lightgray")
        set_html(socket, element_id_to_set, html)

        html = render_to_string(template_to_render, c1: "lightgray", c2: "lightgray", c3: "lightgreen", c4: "lightgray", c5: "lightgray", c6: "lightgray")
        set_html(socket, element_id_to_set, html)

        html = render_to_string(template_to_render, c1: "lightgray", c2: "lightgray", c3: "lightgray", c4: "lightgreen", c5: "lightgray", c6: "lightgray")
        set_html(socket, element_id_to_set, html)

        html = render_to_string(template_to_render, c1: "lightgray", c2: "lightgray", c3: "lightgray", c4: "lightgray", c5: "lightgreen", c6: "lightgray")
        set_html(socket, element_id_to_set, html)

        html = render_to_string(template_to_render, c1: "lightgray", c2: "lightgray", c3: "lightgray", c4: "lightgray", c5: "lightgray", c6: "lightgreen")
        set_html(socket, element_id_to_set, html)

        html = render_to_string(template_to_render, c1: "lightgray", c2: "lightgray", c3: "lightgray", c4: "lightgray", c5: "lightgray", c6: "lightgray")
        set_html(socket, element_id_to_set, html)
      end
    end

  ## ITEMS
    # Items Handler
    defhandler update_list(socket, sender, size) do
      update_items_by_poke(socket, size)
    end

    def update_items_by_poke(socket, size) do
      poke(socket, "main.html", items: items_list(size))
    end

### Helpers
  def items_list(size) do
    size > 0 && Enum.map(1..size, fn(i) -> "This is my item n. #{i}" end) || []
  end


### Callbacks
  onload :loaded
  onconnect :connected
  ondisconnect :disconnected

  def loaded(socket) do
    IO.puts("---> loaded")
  end

  def connected(socket) do
    IO.puts("---> connected")
  end

  def disconnected(store, session) do
    IO.puts("---> disconnected")
  end

end
