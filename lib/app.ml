let layout tabname child =
  let open Dream_html in
  let open HTML in
  Dream_html.respond
  @@ html
       [ lang "en" ]
       [
         head []
           [
             title [] tabname;
             link
               [
                 rel "stylesheet";
                 href
                   "https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css";
                 integrity
                   "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T";
                 crossorigin `anonymous;
               ];
           ];
         meta [ charset "utf-8" ];
         body [] [ child ];
       ]

let content =
  let open Dream_html in
  let open HTML in
  div
    [ class_ "d-flex flex-column justify-content-center" ]
    [
      div
        [ class_ "pt-5 col-md-10 align-self-center" ]
        [ h1 [] [ txt "Dream App" ]; div [] [ txt "hello" ] ];
    ]

let html_to_string html = Format.asprintf "%a" (Tyxml.Html.pp ()) html
let get_port () = 9998

let run () =
  Dream.run ~interface:"0.0.0.0" ~port:(get_port ())
  @@ Dream.logger
  @@ Dream.router [ Dream.get "/" (fun _ -> layout "Dream App" content) ]
