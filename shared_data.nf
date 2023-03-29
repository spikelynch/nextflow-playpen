#!/usr/bin/env nextflow

// experimenting with generating a single file from one process which
// can then be passed to two processes as a channel
//
// make_random_text - generate 10 lines of random text -> random.txt
//
// capitalise_text - take an input channel and capitalise it
//
// reverse_text - take an input channel and reverse each line


process make_random_text {
	output:
	path 'random.txt'

	script:
	"""
${projectDir}/random_text.py > random.txt
	"""
}

process capitalise_text {
	input:
	path 'random.txt'

	output:
	path 'cap.txt'

	script:
	"""
${projectDir}/upcase.py < random.txt > cap.txt
  """
}

process reverse_text {
	input:
	path 'random.txt'

	output:
	path 'reverse.txt'

	script:
	"""
${projectDir}/reverse.py < random.txt > reverse.txt
  """
}



workflow {
	random_ch = make_random_text()
	cap_ch = capitalise_text(random_ch)
	rev_ch = reverse_text(random_ch)
	cap_ch.view { it }
	rev_ch.view { it }
}