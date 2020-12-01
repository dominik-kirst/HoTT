(* -*- mode: coq; mode: visual-line -*- *)
Require Import HoTT.Basics HoTT.Types HoTT.Truncations.
Require Import Modality Accessible.

Local Open Scope path_scope.


(** * The identity modality *)

(** Everything to say here is fairly trivial. *)

Definition purely : Modality.
Proof.
  srapply (Build_Modality (fun _ => Unit) _ _ idmap).
  1-2,6:intros; exact tt.
  - intros; assumption.
  - intros ? ? ? f z; exact (f z).
  - intros; reflexivity.
Defined.

Global Instance accmodality_purely : IsAccModality purely.
Proof.
  unshelve econstructor.
  - econstructor.
    exact (@Empty_rec Type).
  - intros X; split.
    + intros _ [].
    + intros; exact tt.
Defined.

(** A purely connected map is an equivalence. *)
Instance isequiv_purely_conn `{Funext} {A B : Type} (f : A -> B) {conn : IsConnMap purely f}
  : IsEquiv f.
Proof.
  rapply equiv_contr_map_isequiv.
Defined.
