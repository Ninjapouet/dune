open Stdune
module Utils = Utils

type t

exception Stop

exception Error of string

val make : ?root:Path.t -> unit -> t

val default_port_file : unit -> Path.t

val check_port_file :
     ?close:bool
  -> Path.t
  -> ((string * int * Unix.file_descr) option, exn) Result.t

val run : ?port_f:(string -> unit) -> ?port:int -> t -> unit

val stop : t -> unit

val endpoint : t -> string option

module Client : sig
  type t

  val promote :
       t
    -> (Path.t * Digest.t) list
    -> Dune_memory.key
    -> Dune_memory.metadata
    -> int option
    -> (unit, string) Result.t

  val search :
       t
    -> Dune_memory.key
    -> ( Dune_memory.metadata * (Path.t * Path.t * Digest.t) list
       , string )
       Result.t

  val set_build_dir : t -> Path.t -> unit

  val make : unit -> (t, exn) Result.t
end