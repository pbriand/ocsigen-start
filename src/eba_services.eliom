(* Copyright Vincent Balat *)

open Eliom_service
open Eliom_parameter

(********* Services *********)
let main_service =
  service
    ~path:[]
    ~get_params:unit ()

let login_service =
  post_coservice'
    ~name:"login"
    ~post_params:(string "login" ** string "password") ()

let logout_service =
  post_coservice'
    ~name:"logout"
    ~post_params:unit ()

let lost_password_service =
  (* Ask to receive an activation key if the user exists *)
  post_coservice'
    ~keep_get_na_params:false
    ~name:"lost_password"
    ~post_params:(string "email") ()

let sign_up_service =
  (* Ask to receive an activation key if the user does not exist *)
  post_coservice'
    ~keep_get_na_params:false
    ~name:"sign_up"
    ~post_params:(string "email") ()

let activation_service =
  coservice'
    ~name:"activation"
    ~get_params:(string "activationkey") ()

let set_password_service =
  post_coservice'
    ~name:"setpassword"
    ~post_params:(string "password1" ** string "password2") ()

let set_personal_data_service =
  post_coservice'
    ~name:"setdata"
    ~post_params:((string "firstname" ** string "lastname")
                  ** (string "password" ** string "password2")) ()

(*
let preregister_service =
  post_coservice'
    ~name:"preregister"
    ~post_params:(string "email") ()
*)

let admin_service =
  service
    ~path:["admin"]
    ~get_params:unit ()

let crop_service =
  Ew_dyn_upload.service
    ~name:"crop"
    ()
