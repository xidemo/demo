<?php

namespace AppBundle\Form;

use AppBundle\Entity\Order;
use AppBundle\Entity\Product;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class OrderItemType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('order', null, [
                'disabled' => $options['is_edit'],
            ])
            ->add('product', null, [
                'disabled' => $options['is_edit'],
            ])
            ->add('quantity');
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => 'AppBundle\Entity\OrderItem',
            'is_edit' => false,
            'csrf_protection' => false,
            // for put method
            'allow_extra_fields' => true
        ]);
    }

    public function getName()
    {
        return 'order_item';
    }

}