From TLC Require Import LibMultiset.

Axiom (A : Type).

Lemma demo_multiset_union_permut_simpl_2 :
  forall
  (x:A) l1 l2 l3 l4,
  (l1 \u \{x} \u l3 \u l2) \c (l1 \u l2 \u l4 \u (\{x} \u l3)).
Proof using.
  intros.
  (* Elpi Print TC.Solver. *)
  apply permut_tactic_setup.

  (* Elpi Accumulate TC.Solver lp:{{
    :before "eapply" :name "remove" eapply :- !, fail.
  }}. *)
    (* Elpi Override TC TC.Solver None. *)
    (* Set Debug "unification". *)

  (* Set Typeclasses Debug Verbosity 1. *)
  Set Debug "handle_takeover".
  Time rewrite <-union_assoc .
Abort.
x.

1: looking for (Morphisms.Params (@incl) ?H0) with backtracking


Goal forall
  (A : Type) (x:A) l1 l2 l3 l4,
  \{} \u l1 \u '{x} \u l3 \u l2 \u \{} \c l1 \u l2 \u l4 \u ('{x} \u l3) \u \{}.
Proof using.
  intros.
  Elpi Override TC TC.Solver None.
  Time rewrite <-union_assoc.
  do 4 permut_simpl_once. permut_conclude.
Qed.
x.