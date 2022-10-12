class ArticleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.post_created.subject
  #
  def post_created(article)
    @greeting = "Hi"
    @article= article

    mail(
      from: 'mzahid04040@gmail.com',
      to: 'cs.18.b.650@gmail.com',
      # cc: User.all.pluck(:email),
      subject: @article.title
    )
  end

  def article_approved(article)
    @greeting = "Hi"
    @article=article
    mail(
      from: 'zahid@admin.com',
      to: @article.user.email,
      subject: @article.title
    )
  end
end
