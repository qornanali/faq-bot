# :gb: How to make faq-bot step-by-step

## Introduction

Before we start doing something, we should start with _why?_. And in this section it'll explain to you _why?_ FAQ-Bot made.

### Background 🤔

When we make a product, we want our customer or user can use it as we wish. However, along with development of these product, the more information is spread widely and make our customers lose their way.

To solve that, FAQ created. FAQ stand for Frequently Asked Question, FAQ is list of questions that most often asked from customer or user about a certain topic along with the answer.

To increase the quality of FAQ, as a producer we should be able to answer the following question :

- Is the answer appropriate to customer ?
- What other questions do customers often ask?

### Purpose of making 🙋‍♂️

As we know, Facebook _messenger-platform_ has released API that we can use to create smart virtual assistant.
This smart virtual assistant automatically reply the messages from costumer.
This assistant can also be integrated with _wit.ai_ in order to make it easier to understand what customer saying.

By using the features, we are going to make a bot in messenger that able to understand the question from customer.
Then, we will process the question to provide appropriate answer.

## Before Starting

### Prerequisite 📦

- Ruby ~> 2.5 installed on your device.

You may use [rbenv](https://github.com/rbenv/rbenv#installing-ruby-versions)
or [rvm](https://rvm.io/rvm/install#try-out-your-new-rvm-installation), to install ruby

- [Facebook developer](https://developers.facebook.com/) account.

Facebook developer account is required to make new application, that is core of Facebook integration. You can open the link above to create new account.

- [wit.ai](https://wit.ai) account.

This account is required to make NLP model[[1]], use to understand what the user's question.
If you don't have one, click on the link above to create a new one.

- [ngrok](https://ngrok.com/) account and it's all set.

One of the necessities creating bot on _messenger-platform_ that is your apps must supports HTTPS protocol. By using Ngrok, we're able to make public URL that supports the protocol.
We'll be using this device temporarily for development.

## Reference

- https://developers.facebook.com/docs/messenger-platform

- https://guides.rubyonrails.org/

- https://wit.ai/docs

- https://ngrok.com/docs

- https://developercircles2020.devpost.com/details/resources

[1]: https://en.wikipedia.org/wiki/Neuro-linguistic_programming
