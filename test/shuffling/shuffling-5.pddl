(define (problem shuffling-3)
(:domain shuffling_domain)
(:objects block1 block2 block3 block4 pos1 pos2 pos3 pos4)

(:init
(at block1 pos1)
(at block2 pos4)
(at block3 pos2)
(at block4 pos3)

(left pos1 pos2)
(left pos2 pos3)
(left pos3 pos4)
)
(:goal
    (and (at block1 pos1)
         (at block2 pos2)
         (at block3 pos3)
         (at block4 pos4)))
)
