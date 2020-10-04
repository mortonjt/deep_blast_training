from Bio import SearchIO
import numpy as np
import pandas as pd
import sys

# blast_path = '../results/blast_domain_benchmark.xml'
# dom_path = '../data/domains/common_pairs.txt'
# out_path = '../results/blast_domain_alignments.txt'


def get_blast_alignments(blast_path):
    records = SearchIO.parse(blast_path, 'blast-xml')
    hit_list = []
    results = []
    for idx, cur in enumerate(records):
        for hit in cur.hits:
            for i, hsp in enumerate(hit.hsps):
                if cur.id != hit.id:
                    qs = hsp.fragment.query_start
                    qe = hsp.fragment.query_end
                    he = hsp.fragment.hit_end
                    hs = hsp.fragment.hit_start
                    query_s = str(hsp.fragment.query.seq)
                    hit_s = str(hsp.fragment.hit.seq)
                    aln_s = hsp.aln_annotation['similarity']
                    score = hsp.bitscore
                    expect = hsp.evalue
                    toks = list(map(str, [cur.id, hit.id, i, qs, qe, he, hs, query_s, hit_s, aln_s,
                                         score, expect]))
                    results.append(toks)
    columns = ['query_id', 'hit_id', 'fragment_num',
               'query_start', 'query_end', 'hit_start', 'hist_end',
               'query_string', 'hit_string', 'alignment_string', 'score', 'evalue']
    return pd.DataFrame(results, columns=columns)
