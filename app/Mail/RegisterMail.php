<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class RegisterMail extends Mailable
{
    use Queueable, SerializesModels;
    private  $inputs = [] ;

    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct( $inputs = [] )
    {
        $this->inputs = $inputs;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Account Activation') ->from($address = 'info@networkschains.com', $name = 'networkschains.com')->markdown('mail.register', $this->inputs);
    }
}
