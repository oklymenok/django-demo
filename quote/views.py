from django.shortcuts import render
from .models import WisdomQuote
from django.db.models import Count
import random

def index(request):
    """
    Fetches a random quote and renders the main page.
    """
    print("Test")
    try:
        # 1. Get the total number of quotes
        count = WisdomQuote.objects.aggregate(count=Count('id'))['count']

        # 2. Select a random index
        if count > 0:
            random_index = random.randint(0, count - 1)

            # 3. Get the quote at the random index
            random_quote = WisdomQuote.objects.all()[random_index]
        else:
            # Fallback if no quotes exist
            random_quote = None

    except Exception as e:
        # Handle exceptions (e.g., empty database, though covered above)
        print(f"Error fetching quote: {e}")
        random_quote = None

    context = {
        'quote': random_quote
    }
    return render(request, 'quote/index.html', context)
