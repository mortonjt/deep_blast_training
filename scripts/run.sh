DIR=malisam
seqfile=../data/structure_benchmarks/$DIR/seqs.fasta

# results_dir=../results/hmmer
# phmmer --max -A $results_dir/${DIR}_hmmer_alignments.txt -o $results_dir/$DIR-hmm.out $seqfile $seqfile

# results_dir=../results/blast/
# makeblastdb -in $seqfile -dbtype 'prot' -out $results_dir/db
# blastp -db $results_dir/db -query $seqfile -out $results_dir/${DIR}_blast_alignments.xml -outfmt 5

results_dir=../results/psiblast/
makeblastdb -in $seqfile -dbtype 'prot' -out $results_dir/db
psiblast -db $results_dir/db -query $seqfile -out $results_dir/${DIR}_blast_alignments.xml -outfmt 5



DIR=malidup
seqfile=../data/structure_benchmarks/$DIR/seqs.fasta
# results_dir=../results/hmmer
# phmmer --max -A $results_dir/${DIR}_hmmer_alignments.txt -o $results_dir/$DIR-hmm.out $seqfile $seqfile

# results_dir=../results/blast/
# makeblastdb -in $seqfile -dbtype 'prot' -out $results_dir/db
# blastp -db $results_dir/db -query $seqfile -out $results_dir/${DIR}_blast_alignments.xml -outfmt 5

results_dir=../results/psiblast/
makeblastdb -in $seqfile -dbtype 'prot' -out $results_dir/db
psiblast -db $results_dir/db -query $seqfile -out $results_dir/${DIR}_blast_alignments.xml -outfmt 5
