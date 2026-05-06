# Summary

This is the Polish portion of the Parallel Universal Dependencies (PUD) treebanks, created at the [Institute of Computer Science, Polish Academy of Sciences](https://ipipan.waw.pl/en/) in Warsaw (Poland).


# Introduction

PUD-PL consists of 1000 Polish sentences (18,384 tokens) in the same order as in the PUD treebanks in other languages. Morpho-syntactic annotations were automatically predicted by [COMBO](https://github.com/360er0/COMBO) trained on Polish Dependency Bank 2.0 and then manually corrected. Finally, the trees were converted into the UD trees using the same conversion procedure as in the case of the PDB-UD treebank. The annotation schema of PUD-PL is thus the same as in the Polish PDB-UD treebank. 459 PUD-PL trees contain enhanced edges.

# Acknowledgments

We want to thank all contributors to the Polish Parallel UD treebank, as well as the supporting and founding institutions:

* The development of the PDB-UD treebank (v2.18) was funded by the Polish Ministry of Science and Higher Education as part of the investment in the [CLARIN-PL](https://clarin-pl.eu//) research infrastructure (CLARIN Quintus, grant number: 2024/WK/01).
* This work was supported by COST Action CA21167 - Universality, diversity and idiosyncrasy in language technology ([UniDive](https://unidive.lisn.upsaclay.fr)).
* The development of the PDB-UD treebank (v2.13) was funded by Digital Research Infrastructure for the Arts and Humanities DARIAH-PL (project no. POIR.04.02.00-00-D006/20-00).
* The development of the PDB-UD treebank (v2.5) was funded by the Polish Ministry of Science and Higher Education as part of the investment in the CLARIN-PL research infrastructure.

## References

If you use the Polish PUD treebank, you are encouraged to cite this paper:

<pre>
@inproceedings{pl,
  author    = {Wr{\'o}blewska, Alina},
  title     = {Extended and Enhanced Polish Dependency Bank in Universal Dependencies Format},
  booktitle = {Proceedings of the Second Workshop on Universal Dependencies (UDW 2018)},
  editor    = {de Marneffe, Marie-Catherine and Lynn, Teresa and Schuster, Sebastian},
  pages     = {173--182},
  publisher = {Association for Computational Linguistics},
  year      = {2018}
}
</pre>


# Changelog

* 2026-05-15 v2.18
  * Introducing fixes and improvements on a global scale across all annotation layers.
  * External parts of speech (ExtPos) added.
  * Comparative clauses dependent on nouns annotated as `acl:cmpr`, `amod:cmpr`, `nmod:cmpr`
* 2023-11-15 v2.13
  * Introducing fixes and improvements on the global scale across all annotation layers.
* 2022-05-15 v2.10
  * Restored the sentence ids that are used in all PUD treebanks.
* 2019-11-15 v2.5
  * Fixed nominal dependents of nouns that were attached as obl; correct: nmod.
  * Fixed adjectival participle dependents of nouns that were attached as amod; correct acl.
  * Adjectival parts of names (e.g. organisation names, dates) not being named entities are now adj:flat instead of flat.
  * Nominal parts of names (e.g. organisation names, dates) not being named entities are now nmod:flat instead of flat.
  * Emphasising words are annotated as advmod:emph.
  * Morphological bugs are fixed.
* 2019-05-15 v2.4
  * Initial release in Universal Dependencies.


<pre>
=== Machine-readable metadata (DO NOT REMOVE!) ================================
Data available since: UD v2.4
License: CC BY-SA 4.0
Includes text: yes
Parallel: pud
Genre: nonfiction news
Lemmas: converted from manual
UPOS: converted from manual
XPOS: manual native
Features: converted from manual
Relations: converted from manual
Contributors: Wróblewska, Alina
Contributing: elsewhere
Contact: alina@ipipan.waw.pl
===============================================================================
</pre>
