# 03 – Readability tricks

Ordered by impact. Items 1–5c were verified with the examples in this repo; 6–12
are general PlantUML/Graphviz practice.

## Verified in this repo

1. **Labels as nodes.** The biggest win; see [02](02-label-nodes.md).
2. **Declare label nodes in the right package.** Same-package link → inside that
   package; cross-package link → inside the target package.
3. **Notes on label nodes, not on links.** `note right of l_x` instead of `note on link`.
4. **Direction hints position labels.** `"right"`, `"left"`, `"up"`, `"down"` in `$via`.
   For back edges compare `-up-` with `-[norank]-`.
5. **Mute the labels.** Smaller grey font (`FontSize 10`, `FontColor #444444`) so
   labels read as annotations, not as components.
5a. **Ports for parallel links.** One `portin`/`portout` per link gives each link its
   own endpoint; invisible ports with visible names act as pinned labels ([05](05-ports.md)).
5b. **Numbers + legend.** Short native labels rarely collide; the text goes into a
   legend table ([06](06-numbered-labels.md)).
5c. **Consider Mermaid + ELK** if UML notation is not required ([07](07-mermaid.md)).

## General practice

6. **Declaration order matters.** Graphviz loosely keeps nodes in declaration order.
   Reordering components inside a package often removes crossings.

7. **Link length sets the distance.** `-->` = one layer apart, `--->` = two.
   Give crowded areas more room with longer links.

8. **Hidden links for alignment.**

   ```plantuml
   a -[hidden]right- b
   together {
     [Cache]
     [Inventory DB]
   }
   ```

9. **Merge parallel links when the detail is not needed.**
   One line `create / cancel / status` beats three lines. Fewer lines beat any
   layout trick.

10. **Encode meaning in line style, not text.** Dashed for async or reads, a
    colour per flow, and a legend:

    ```plantuml
    order -[#2a7ab0]-> bus
    order -[dashed]-> db
    legend right
      blue = events, dashed = reads
    endlegend
    ```

11. **Split big diagrams.** Beyond roughly 10–12 components and 25+ links, ortho
    gets tangled whatever you do. One overview with the main lines, plus one
    diagram per flow (ordering, billing, events).

12. **Keep a top-down flow.** Users on top, services in the middle, data stores at
    the bottom, so most links point down. Use `left to right direction` only for
    chain-like diagrams.

## Quick checklist

- [ ] `skinparam linetype ortho` + label-node helpers
- [ ] every label node declared in the right package
- [ ] notes attached to label nodes
- [ ] components declared in a sensible order
- [ ] parallel links merged where the detail does not matter
- [ ] line styles + legend instead of long label text
- [ ] diagram split if it has more than ~12 components
