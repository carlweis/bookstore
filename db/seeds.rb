Product.delete_all

Product.create!(title: 'Programming Ruby 1.9 & 2.0',
  description:
    %{
      <p>
      Ruby is the fastest growing and most exciting dynamic language
out there. If you need to get working programs delivered fast,
you should add Ruby to your toolbox.
      </p>
    },
    image_url: 'ruby.jpg',
    price: 49.95
)

Product.create!(title: 'CoffeeScript',
  description:
    %{
      <p>
        Over the last five years, CoffeeScript has taken the web development
        world by storm. With the humble motto “It’s just JavaScript,
        ” CoffeeScript provides all the power of the JavaScript language in a
        friendly and elegant package. This extensively revised and updated
        new edition includes an all-new project to demonstrate CoffeeScript
        in action, both in the browser and on a Node.js server.
        There’s no faster way to learn to write a modern web application.
      </p>
    },
    image_url: 'cs.jpg',
    price: 37.00
)
