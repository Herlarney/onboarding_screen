class OnboardingContent {
  String? image;
  String? title;
  String? description;
  OnboardingContent({
    this.description,
    this.image,
    this.title,
  });
}

List<OnboardingContent> contents = [
  OnboardingContent(
    title: 'Qality bank',
    image: 'images/bro.png',
    description:
        'simply dummy text of writing and typing industry Lorem Ipsum has the industry standard dummy text ever since 1500when an unknown printer took a galley and stampled it',
  ),
  OnboardingContent(
    title: 'Fast delivery',
    image: 'images/fb.jpg',
    description:
        'simply dummy text of writing and typing industry Lorem Ipsum has the industry standard dummy text ever since 1500when an unknown printer took a galley and stampled it',
  ),
  OnboardingContent(
    title: 'Reward surprises',
    image: 'images/fbi.jpg',
    description:
        'simply dummy text of writing and typing industry Lorem Ipsum has the industry standard dummy text ever since 1500when an unknown printer took a galley and stampled it',
  ),
];
