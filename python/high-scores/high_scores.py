# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.

def latest(scores_aleluya):
    return scores_aleluya[-1]


def personal_best(scores_aleluya):
    return max(scores_aleluya)


def personal_top_three(scores_aleluya):
    return sorted(scores_aleluya, reverse=True)[0:3]